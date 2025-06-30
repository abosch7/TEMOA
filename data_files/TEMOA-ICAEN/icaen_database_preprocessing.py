import pandas as pd
import numpy as np
import sqlite3
import time

# Input data and preliminary operations

conn = sqlite3.connect("TEMOA_ICAEN.sqlite")

lifetime_default = 40
print_i = 0

print_status = True

print_outcome = {'presencia_apats':                    False,
                 'presencia_apats':                   False}

save_tosql = {'presencia_apats':                    True,
              'presencia_apats':                   True}

time_periods = pd.read_sql("SELECT * FROM time_data", conn)  # Extracting the time_data
time_periods = time_periods.sort_values(by=['t_data'], ignore_index=True)
time_periods = time_periods.drop(len(time_periods)-1)  # Removing the last milestone year (it is in time_future but not in time_periods)
time_periods = list(time_periods.t_periods)

print('_______________________________________________________________________')
print("{:>62}".format('Output code of database_preprocessing.py:'))
print(time_periods)


# # EmissionLimit

# start_time = time.time()

# EmissionLimit = pd.read_sql("SELECT * FROM EmissionLimit", conn)  # Loading the EmissionLimit table from the .SQLite database

# regions = list()
# periods = list()
# emis_comm = list()
# emis_limit = list()
# emis_limit_units = list()
# emis_limit_notes = list()

# # Extracting the list of all indexes combinations for EmissionLimit
# indexes = list()
# for i in range(0, len(EmissionLimit)):
#     indexes.append(EmissionLimit.regions[i] + EmissionLimit.emis_comm[i])
# EmissionLimit['indexes'] = indexes
# indexes = list(dict.fromkeys(indexes))  # Removing duplicates

# # Interpolating/extrapolating
# for index_i in indexes:
#     EmissionLimit_i = EmissionLimit[(EmissionLimit['indexes'] == index_i)]
#     EmissionLimit_i = EmissionLimit_i.sort_values(by=['periods'], ignore_index=True)
#     for i in range(0, len(EmissionLimit_i.periods)):
#         if i < len(EmissionLimit_i.periods) - 1:  # Interpolation
#             # Extracting time periods involved in the interpolation
#             time_periods_i = [x for x in time_periods if EmissionLimit_i.periods[i] <= x < EmissionLimit_i.periods[i+1]]
#             for j in range(0, len(time_periods_i)):
#                 if j == 0:  # Only used for the first time period available (to avoid / 0 in the linear interpolation equation)
#                     regions.append(EmissionLimit_i.regions[i])
#                     periods.append(time_periods_i[j])
#                     emis_comm.append(EmissionLimit_i.emis_comm[i])
#                     emis_limit.append(float(EmissionLimit_i.emis_limit[i]))
#                     emis_limit_units.append(EmissionLimit_i.emis_limit_units[i])
#                     emis_limit_notes.append(EmissionLimit_i.emis_limit_notes[i])
#                 else:  # Linear interpolation for intermediate time periods
#                     regions.append(EmissionLimit_i.regions[i])
#                     periods.append(time_periods_i[j])
#                     emis_comm.append(EmissionLimit_i.emis_comm[i])
#                     emis_limit.append(float(EmissionLimit_i.emis_limit[i] +
#                                             (EmissionLimit_i.emis_limit[i + 1] - EmissionLimit_i.emis_limit[i]) *
#                                             (time_periods_i[j] - EmissionLimit_i.periods[i]) /
#                                             (EmissionLimit_i.periods[i + 1] - EmissionLimit_i.periods[i])))
#                     emis_limit_units.append(EmissionLimit_i.emis_limit_units[i])
#                     emis_limit_notes.append(EmissionLimit_i.emis_limit_notes[i])
#         else:  # Extrapolation
#             # Extracting time periods involved in the extrapolation
#             time_periods_i = [x for x in time_periods if x >= EmissionLimit_i.periods[i]]
#             for j in range(0, len(time_periods_i)):
#                 regions.append(EmissionLimit_i.regions[i])
#                 periods.append(time_periods_i[j])
#                 emis_comm.append(EmissionLimit_i.emis_comm[i])
#                 emis_limit.append(float(EmissionLimit_i.emis_limit[i]))
#                 emis_limit_units.append(EmissionLimit_i.emis_limit_units[i])
#                 emis_limit_notes.append(EmissionLimit_i.emis_limit_notes[i])

# # Converting lists into a DataFrame
# EmissionLimit = pd.DataFrame(
#     {
#         "regions": pd.Series(regions, dtype='str'),
#         "periods": pd.Series(periods, dtype='int'),
#         "emis_comm": pd.Series(emis_comm, dtype='str'),
#         "emis_limit": pd.Series(emis_limit, dtype='float'),
#         "emis_limit_units": pd.Series(emis_limit_units, dtype='str'),
#         "emis_limit_notes": pd.Series(emis_limit_notes, dtype='str')
#     }
# )

# if save_tosql['EmissionLimit']:
#     EmissionLimit.to_sql('EmissionLimit', conn, index=False, if_exists='replace')

# if print_outcome['EmissionLimit']:
#     pd.set_option('display.max_rows', len(EmissionLimit))
#     pd.set_option('display.max_columns', 10)
#     print("\nEmissionLimit DataFrame\n\n", EmissionLimit)
#     pd.reset_option('display.max_rows')
#     pd.reset_option('display.max_columns')

# end_time = time.time()

# print_i = print_i + 1
# if print_status:
#     print("{:>1} {:>2} {:>1} {:>2} {:>1} {:>50} {:>6} {:>1}".format('[', print_i, '/', len(print_outcome), ']', 'EmissionLimit interpolated.',
#                                                                     np.format_float_positional(abs(end_time - start_time), 2), 's'))