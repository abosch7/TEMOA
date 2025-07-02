import pandas as pd
import numpy as np
import sqlite3
import time

# Input data and preliminary operations

conn = sqlite3.connect("TEMOA_ICAEN.sqlite")

lifetime_default = 40
print_i = 0

print_status = True

print_outcome = {'cuina':                    False,
                 'cuina':                   False}

save_tosql = {'cuina':                    True,
              'cuina':                   True}

time_periods = pd.read_sql("SELECT * FROM time_slices", conn)  
time_periods = time_periods.sort_values(by=['t_slices'], ignore_index=True)
time_periods = list(time_periods.t_slices)

time_periods_past = pd.read_sql("SELECT * FROM time_slices WHERE past = 1", conn) 
time_periods_past = time_periods_past.sort_values(by=['t_slices'], ignore_index=True)
time_periods_past = list(time_periods_past.t_slices)

time_periods_future = pd.read_sql("SELECT * FROM time_slices WHERE past = 0", conn) 
time_periods_future = time_periods_future.sort_values(by=['t_slices'], ignore_index=True)
time_periods_future = list(time_periods_future.t_slices)


print('_______________________________________________________________________')
print("{:>62}".format('Output code of database_preprocessing.py:'))


## CUINA

start_time = time.time()

# Loading the cuina table from the .SQLite database
cuina = pd.read_sql("SELECT * FROM cuina", conn)  

# Generating lists for every index in table
cuina_param = list()
cuina_scen = list()
cuina_prod = list()
cuina_value = list()
cuina_unitats = list()
cuina_flag = list()

# Extracting the list of all indexes combinations for EmissionLimit
indexes = list()
for i in range(0, len(cuina)):
    indexes.append(cuina.param[i] + cuina.scen[i] + cuina.produc[i])
cuina['indexes'] = indexes
indexes = list(dict.fromkeys(indexes))  # Removing duplicates

print(cuina)
print(indexes)