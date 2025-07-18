import pandas as pd
import numpy as np
import sqlite3
import time
from scipy.interpolate import interp1d

# Input data and preliminary operations

conn = sqlite3.connect("TEMOA_ICAEN.sqlite")

print_i = 0
table_name = 'cuina'

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
print()
print("{:>62}".format('Output code of database_preprocessing.py:'))
print()


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

        ###___________________________________________________________________________________________________________________________________

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

###___________________________________________________________________________________________________________________________________

        # # Filtrar y ordenar los datos
        # data_selection_i = data_selection[data_selection['INDEXES'] == index_i]
        # data_selection_i = data_selection_i.sort_values(by='T_SLICES', ignore_index=True)

        # # Base de tiempo y valores
        # t_base = data_selection_i.T_SLICES.values
        # v_base = data_selection_i.VALUE.values

        # # Crear función de interpolación (con extrapolación constante)
        # if len(t_base) >= 3:
        #     f_interp = interp1d(
        #         t_base, v_base,
        #         kind='linear',
        #         fill_value=(v_base[0], v_base[-1]),  # constante fuera de rango
        #         bounds_error=False
        #     )
        # else:
        #     f_interp = interp1d(
        #         t_base, v_base,
        #         kind='linear',
        #         fill_value=(v_base[0], v_base[-1]),
        #         bounds_error=False
        #     )

        # # Loop principal
        # for i in range(len(t_base)):
        #     if i < len(t_base) - 1:  # Interpolación
        #         time_periods_i = [x for x in time_periods if t_base[i] <= x < t_base[i+1]]

        #         for j, t in enumerate(time_periods_i):
        #             cuina_PARAM.append(data_selection_i.PARAM[i])
        #             cuina_SCEN.append(data_selection_i.SCEN[i])
        #             cuina_PRODU.append(data_selection_i.PRODU[i])
        #             cuina_T_SLICES.append(t)
                    
        #             if j == 0:
        #                 cuina_VALUE.append(data_selection_i.VALUE[i])
        #                 cuina_FLAG.append(data_selection_i.FLAG[i])
        #             else:
        #                 cuina_VALUE.append(float(f_interp(t)))  # interpolado
        #                 cuina_FLAG.append(1)

        #             cuina_UNITATS.append(data_selection_i.UNITATS[i])

        #     else:  # Extrapolación (más allá del último T_SLICE)
        #         time_periods_i = [x for x in time_periods if x >= t_base[i]]

        #         for t in time_periods_i:
        #             cuina_PARAM.append(data_selection_i.PARAM[i])
        #             cuina_SCEN.append(data_selection_i.SCEN[i])
        #             cuina_PRODU.append(data_selection_i.PRODU[i])
        #             cuina_T_SLICES.append(t)
        #             cuina_VALUE.append(float(f_interp(t)))  # extrapolado (constante)
        #             cuina_UNITATS.append(data_selection_i.UNITATS[i])
        #             cuina_FLAG.append(1)



###___________________________________________________________________________________________________________________________________
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