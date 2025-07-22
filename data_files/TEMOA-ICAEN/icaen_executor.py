"""
Arxiu d'execusió model demanda -- ICAEN
Manel Serrano Borja <mserrano@irec.cat>, ESA
Antoni Bosch Pons <abosch@irec.cat>, ESA
"""

import os
import sqlite3
import time
import numpy as np
from icaen_database_preprocessing import process_table

sql_modules = ['TEMOA_ICAEN.sql']
sqlite_database = "TEMOA_ICAEN.sqlite"
table_param_map = {
    'cuina': ['PRESAP', 'CANVAP', 'REPFORM', 'REND'],
    'rentadora': ['CANVRENT', 'DRENT'],
    'test':['PROVA']
}
interpolation_method = 'leard'

Deleting = True
Reading = True
Preprocessing = True
Projecting = True

# Check if the SQLite database already exists and delete it
start_time = time.time()
if Deleting:
    if os.path.exists(sqlite_database):
        os.remove(sqlite_database)
        end_time = time.time()
        elapsed = abs(end_time - start_time)
        print("{:>62} {:>4} {:>0}".format('Existing SQLite database deleted.', np.format_float_positional(abs(elapsed), 2), 's'))

# Create the SQLite database and execute the SQL code(s)

start_time = time.time()
if Reading:
    for sql in sql_modules:
        conn = sqlite3.connect(sqlite_database)
        with open(sql, mode='r', encoding='utf-8-sig') as sql_code:
            conn.executescript(sql_code.read())
        conn.commit()
        conn.close()
    end_time = time.time()
    elapsed = abs(end_time - start_time)
    print("{:>62} {:>4} {:>0}".format('SQLite database created and SQL code executed.', np.format_float_positional(abs(elapsed), 2), 's'))

# Execute the database_preprocessing.py script

start_time = time.time()
if Preprocessing:
    print('_______________________________________________________________________\n')
    print("{:>62}".format('Output code of database_preprocessing.py:\n'))
    conn = sqlite3.connect(sqlite_database)
    for idx, (table_name, interpol_param) in enumerate(table_param_map.items(), 1):
        try:
            message = process_table(conn, table_name, interpol_param, interpolation_method)
            print("{:>62}".format(f"[{idx}/{len(table_param_map)}] {message}"))
        except Exception as e:
            print("{:>62}".format(f"[{idx}/{len(table_param_map)}] Error processing table '{table_name}'--> {e}"))
    conn.commit()
    conn.close()
    
    print()
    end_time = time.time()
    elapsed = abs(end_time - start_time)
    print("{:>62} {:>4} {:>0}".format('SQLite database preprocessed.', np.format_float_positional(abs(elapsed), 2), 's'))


# Simplify the SQLite database by removing the selected set of milestone years
start_time = time.time()
if Projecting:
    with open("icaen_cuina_projection.py") as projecting:
        exec(projecting.read())
    print()
    end_time = time.time()
    elapsed = abs(end_time - start_time)
    print("{:>62} {:>4} {:>0}".format('Demand sectors projected.', np.format_float_positional(abs(elapsed), 2), 's'))
    print()

conn = sqlite3.connect(sqlite_database)
conn.execute("VACUUM")
conn.close()