import pandas as pd
import numpy as np
import sqlite3
import time

# Input data and preliminary operations

conn = sqlite3.connect("TEMOA_ICAEN.sqlite")

lifetime_default = 40
print_i = 0

print_status = True
#Indicate wich tables should be interpolated/extrapolated
tables = ["cuina"]

#Indicate which parameter should be interpolated/extrapolated
interpol_param = ['PRESAP', 'CANVAP', 'REPFORM', 'REND']

#Indicate if you want to print the execution of the tables preprocessing
print_outcome = {'cuina':                    False
                 }

#Indicate if you want to save the execution of the tables in the sqlite file
save_tosql = {'cuina':                    True
              }

time_periods = pd.read_sql("SELECT * FROM time_slices", conn)  
time_periods = time_periods.sort_values(by=['T_SLICES'], ignore_index=True)
time_periods = list(time_periods.T_SLICES)

time_periods_past = pd.read_sql("SELECT * FROM time_slices WHERE PAST = 1", conn) 
time_periods_past = time_periods_past.sort_values(by=['T_SLICES'], ignore_index=True)
time_periods_past = list(time_periods_past.T_SLICES)

time_periods_future = pd.read_sql("SELECT * FROM time_slices WHERE PAST = 0", conn) 
time_periods_future = time_periods_future.sort_values(by=['T_SLICES'], ignore_index=True)
time_periods_future = list(time_periods_future.T_SLICES)

escenaris = pd.read_sql("SELECT * FROM escenaris", conn)  
escenaris = escenaris.sort_values(by=['SCEN'], ignore_index=True)
escenaris = list(escenaris.SCEN)

productes = pd.read_sql("SELECT * FROM productes", conn)  
productes = productes.sort_values(by=['PRODU'], ignore_index=True)
productes = list(productes.PRODU)



print('_______________________________________________________________________')
print("{:>62}".format('Output code of database_preprocessing.py:'))


## CUINA
start_time = time.time()

# Loading the cuina table from the .SQLite database
data_selection = pd.read_sql("SELECT * FROM cuina", conn)

# Generating lists for every index in table
cuina_PARAM = list()
cuina_SCEN = list()
cuina_PRODU = list()
cuina_T_SLICES = list()
cuina_VALUE = list()
cuina_UNITATS = list()
cuina_FLAG = list()

# Extracting the list of all indexes combinations for data_selections
indexes = list()
for i in range(0, len(data_selection)):
    if data_selection.PARAM[i] in interpol_param: # Only parameters specified in interpol_param list
        index = str(data_selection.PARAM[i]) + str(data_selection.SCEN[i]) + str(data_selection.PRODU[i])
        indexes.append(index)
    else:
        index = str('NONE')
        indexes.append(index)
data_selection['INDEXES'] = indexes
indexes = list(dict.fromkeys(indexes))  # Removing duplicates

# Interpolating/extrapolating
for index_i in indexes:
    if index_i == str('NONE'):
        data_selection_i = data_selection[(data_selection['INDEXES'] == index_i)]
        data_selection_i = data_selection_i.sort_values(by=['T_SLICES'], ignore_index=True)
        for i in range(0, len(data_selection_i.T_SLICES)):
            cuina_PARAM.append(data_selection_i.PARAM[i])
            cuina_SCEN.append(data_selection_i.SCEN[i])
            cuina_PRODU.append(data_selection_i.PRODU[i])
            cuina_T_SLICES.append(data_selection_i.T_SLICES[i]) 
            cuina_VALUE.append(data_selection_i.VALUE[i]) 
            cuina_UNITATS.append(data_selection_i.UNITATS[i]) 
            cuina_FLAG.append(data_selection_i.FLAG[i]) 
    else:
        data_selection_i = data_selection[(data_selection['INDEXES'] == index_i)]
        data_selection_i = data_selection_i.sort_values(by=['T_SLICES'], ignore_index=True)
        for i in range(0, len(data_selection_i.T_SLICES)):
            if i < len(data_selection_i.T_SLICES) - 1:  # Interpolation
                # Extracting time periods involved in the interpolation
                time_periods_i = [x for x in time_periods if data_selection_i.T_SLICES[i] <= x < data_selection_i.T_SLICES[i+1]]
                for j in range(0, len(time_periods_i)):
                    if j == 0:  # Only used for the first time period available (to avoid / 0 in the linear interpolation equation)
                        cuina_PARAM.append(data_selection_i.PARAM[i])
                        cuina_SCEN.append(data_selection_i.SCEN[i])
                        cuina_PRODU.append(data_selection_i.PRODU[i])
                        cuina_T_SLICES.append(data_selection_i.T_SLICES[i]) 
                        cuina_VALUE.append(data_selection_i.VALUE[i]) 
                        cuina_UNITATS.append(data_selection_i.UNITATS[i]) 
                        cuina_FLAG.append(data_selection_i.FLAG[i]) 
                    
                    else:  # Linear interpolation for intermediate time periods
                        cuina_PARAM.append(data_selection_i.PARAM[i])
                        cuina_SCEN.append(data_selection_i.SCEN[i])
                        cuina_PRODU.append(data_selection_i.PRODU[i])
                        cuina_T_SLICES.append(time_periods_i[j]) 
                        cuina_VALUE.append(float(data_selection_i.VALUE[i] +
                                                (data_selection_i.VALUE[i + 1] - data_selection_i.VALUE[i]) *
                                                (time_periods_i[j] - data_selection_i.T_SLICES[i]) /
                                                (data_selection_i.T_SLICES[i + 1] - data_selection_i.T_SLICES[i]))) 
                        cuina_UNITATS.append(data_selection_i.UNITATS[i]) 
                        cuina_FLAG.append(1) 

            else:  # Extrapolation
                # Extracting time periods involved in the extrapolation
                time_periods_i = [x for x in time_periods if x >= data_selection_i.T_SLICES[i]]
                for j in range(0, len(time_periods_i)):
                    cuina_PARAM.append(data_selection_i.PARAM[i])
                    cuina_SCEN.append(data_selection_i.SCEN[i])
                    cuina_PRODU.append(data_selection_i.PRODU[i])
                    cuina_T_SLICES.append(time_periods_i[j]) 
                    cuina_VALUE.append(data_selection_i.VALUE[i]) 
                    cuina_UNITATS.append(data_selection_i.UNITATS[i]) 
                    cuina_FLAG.append(1) 

# Converting lists into a DataFrame
new_data_selection = pd.DataFrame(
    {
        "PARAM": pd.Series(cuina_PARAM, dtype='str'),
        "SCEN": pd.Series(cuina_SCEN, dtype='str'),
        "T_SLICES": pd.Series(cuina_T_SLICES, dtype='int'),
        "PRODU": pd.Series(cuina_PRODU, dtype='str'),
        "VALUE": pd.Series(cuina_VALUE, dtype='float'),
        "UNITATS": pd.Series(cuina_UNITATS, dtype='str'),
        "FLAG": pd.Series(cuina_FLAG, dtype='int'),

    }
)

new_data_selection = new_data_selection.sort_values(by=['PARAM', 'SCEN', 'T_SLICES', 'PRODU', 'VALUE', 'UNITATS', 'FLAG'], ignore_index=True)

if save_tosql['cuina']:
    new_data_selection.to_sql('cuina', conn, index=False, if_exists='replace')

if print_outcome['cuina']:
    pd.set_option('display.max_rows', len(data_selection))
    pd.set_option('display.max_columns', 10)
    print("\ncuina DataFrame\n\n", data_selection[0:1000])
    pd.reset_option('display.max_rows')
    pd.reset_option('display.max_columns')

end_time = time.time()

print_i = print_i + 1
if print_status:
    print("{:>1} {:>2} {:>1} {:>2} {:>1} {:>50} {:>6} {:>1}".format('[', print_i, '/', len(print_outcome), ']',
                                                                    'cuina table calculated and interpolated.',
                                                                    np.format_float_positional(abs(end_time - start_time), 2), 's'))

#--------------------------------------------------------------------------------

#Projecció demanda sector cuina

cONGN = pd.read_sql("SELECT *FROM cuina WHERE PARAM = 'CONGN'", conn).VALUE
pRESAP = pd.read_sql("SELECT VALUE, T_SLICES, SCEN, PRODU FROM cuina WHERE PARAM = 'PRESAP'", conn)
cANVAP = pd.read_sql("SELECT VALUE, T_SLICES, SCEN, PRODU FROM cuina WHERE PARAM = 'CANVAP'", conn)
rEND = pd.read_sql("SELECT VALUE, T_SLICES, SCEN, PRODU FROM cuina WHERE PARAM = 'REND'", conn)
pERHAB = pd.read_sql("SELECT VALUE, T_SLICES, SCEN, PRODU FROM cuina WHERE PARAM = 'PERHAB'", conn)
rEPFORM = pd.read_sql("SELECT VALUE, T_SLICES, SCEN, PRODU FROM cuina WHERE PARAM = 'REPFORM'", conn)


q_GN = np.mean((cONGN/0.086)*1000)
q_ind = list()
q_hab = list()
q_final = list()
q_end = list()
cuina_UNITATS = list()
cuina_FLAG = list()

# Extracting the list of all indexes combinations for data_selections
indexes = list()
for i in range(0, len(data_selection)):
    if data_selection.PARAM[i] in interpol_param: # Only parameters specified in interpol_param list
        index = str(data_selection.PARAM[i]) + str(data_selection.SCEN[i]) + str(data_selection.PRODU[i])
        indexes.append(index)
    else:
        index = str('NONE')
        indexes.append(index)
data_selection['INDEXES'] = indexes
indexes = list(dict.fromkeys(indexes))  # Removing duplicates



for t in range(0, len(time_periods)):
    for s in range(0,len(escenaris)):
        for f in range(0,len(productes)):
            a = 1





# ##-----------------------------------------------------------------------------------------------------------------------------------
# # Demand (from the previous database_preprocessing.py)

# start_time = time.time()

# cONGN = pd.read_sql("SELECT * FROM cuina WHERE PARAM = 'CONGN'", conn).VALUE
# pRESAP = pd.read_sql("SELECT VALUE, T_SLICES, SCEN, PRODU FROM cuina WHERE PARAM = 'PRESAP'", conn)
# cANVAP = pd.read_sql("SELECT VALUE, T_SLICES, SCEN, PRODU FROM cuina WHERE PARAM = 'CANVAP'", conn)
# rEND = pd.read_sql("SELECT VALUE, T_SLICES, SCEN, PRODU FROM cuina WHERE PARAM = 'REND'", conn)
# pERHAB = pd.read_sql("SELECT VALUE, T_SLICES, SCEN, PRODU FROM cuina WHERE PARAM = 'PERHAB'", conn)
# rEPFORM = pd.read_sql("SELECT VALUE, T_SLICES, SCEN, PRODU FROM cuina WHERE PARAM = 'REPFORM'", conn)

# results_cuina_VAR = list()
# results_cuina_SCEN = list()
# results_cuina_PRODU = list()
# results_cuina_T_SLICES = list()
# results_cuina_VALUE = list()
# results_cuina_UNITATS = list()
# results_cuina_FLAG = list()


# for t in range(0, len(time_periods)):
#     if t == 0:
        
#     else:

#     for s in range(0,len(escenaris)):
#         for f in range(0,len(productes)):
#             a = 1


# for i in range(0, len(Demand.demand_comm)):
#     if Demand.periods[i] == base_year:
#         regions.append(Demand.regions[i])
#         periods.append(int(Demand.periods[i]))
#         demand_comm.append(Demand.demand_comm[i])
#         demand.append(Demand.demand[i])
#         demand_units.append(Demand.demand_units[i])
#         demand_notes.append(Demand.demand_notes[i])
#         for j in range(0, len(Allocation.demand_comm)):
#             if Allocation.demand_comm[j] == Demand.demand_comm[i]:
#                 for k in range(0, len(Driver.periods)):
#                     if Driver.driver_name[k] == Allocation.driver_name[j]:
#                         for l in range(0, len(Elasticity.periods)):
#                             if Elasticity.demand_comm[l] == Demand.demand_comm[i] and Driver.periods[k] == Elasticity.periods[l]:
#                                 regions.append(Elasticity.regions[l])
#                                 periods.append(int(Elasticity.periods[l]))
#                                 demand_comm.append(Elasticity.demand_comm[l])
#                                 if not Driver.periods[k] == base_year:
#                                     demand.append(float(np.format_float_scientific(demand[len(demand) - 1] * (1 + (Driver.driver[k] / Driver.driver[k - 1] - 1) * Elasticity.elasticity[l]))))
#                                     demand_units.append(demand_units[len(demand_units) - 1])
#                                 demand_notes.append('')

# Demand_1 = pd.DataFrame(
#     {
#         "regions": pd.Series(regions, dtype='str'),
#         "periods": pd.Series(periods, dtype='int'),
#         "demand_comm": pd.Series(demand_comm, dtype='str'),
#         "demand": pd.Series(demand, dtype='float'),
#         "demand_units": pd.Series(demand_units, dtype='str'),
#         "demand_notes": pd.Series(demand_notes, dtype='str')
#     }
# )

# for i in range(0, len(Demand_1)):
#     if Demand_1.loc[i, lambda df: "periods"] == base_year:
#         Demand_1 = Demand_1.drop(index=[i])
# Demand_1 = Demand_1.reset_index(drop=True)

# regions = list()
# periods = list()
# demand_comm = list()
# demand = list()
# demand_units = list()
# demand_notes = list()
# flag_delete = list()

# for i in range(0, len(Demand.demand_comm)):
#     if Demand.periods[i] != base_year:
#         flag_check = 0
#         for j in range(0, len(Demand_1)):
#             if Demand.regions[i] == Demand_1.regions[j] and Demand.demand_comm[i] == Demand_1.demand_comm[j] and Demand.periods[i] == Demand_1.periods[j]:
#                 flag_delete.append(j)
#         regions.append(Demand.regions[i])
#         periods.append(int(Demand.periods[i]))
#         demand_comm.append(Demand.demand_comm[i])
#         demand.append(Demand.demand[i])
#         demand_units.append(Demand.demand_units[i])
#         demand_notes.append(Demand.demand_notes[i])

# Demand_1 = Demand_1.drop(flag_delete)
# Demand_1 = Demand_1.reset_index(drop=True)

# Demand_2 = pd.DataFrame(
#     {
#         "regions": pd.Series(regions, dtype='str'),
#         "periods": pd.Series(periods, dtype='int'),
#         "demand_comm": pd.Series(demand_comm, dtype='str'),
#         "demand": pd.Series(demand, dtype='float'),
#         "demand_units": pd.Series(demand_units, dtype='str'),
#         "demand_notes": pd.Series(demand_notes, dtype='str')
#     }
# )

# if len(Demand_1) != 0 or len(Demand_2) != 0:
#     Demand = pd.merge(Demand_1, Demand_2, how='outer')
#     Demand = Demand.sort_values(by=['regions', 'demand_comm', 'periods'], ignore_index=True)

# if save_tosql['Demand']:
#     Demand.to_sql('Demand', conn, index=False, if_exists='replace')

# if print_outcome['Demand']:
#     pd.set_option('display.max_rows', len(Demand))
#     pd.set_option('display.max_columns', 10)
#     print("\nDemand DataFrame\n\n", Demand)
#     pd.reset_option('display.max_rows')
#     pd.reset_option('display.max_columns')

# end_time = time.time()

# print_i = print_i + 1
# if print_status:
#     print("{:>1} {:>2} {:>1} {:>2} {:>1} {:>50} {:>6} {:>1}".format('[', print_i, '/', len(print_outcome), ']', 'Demand projected.',
#                                                                     np.format_float_positional(abs(end_time - start_time), 2), 's'))


# ##-----------------------------------------------------------------------------------------------------------------------------------
