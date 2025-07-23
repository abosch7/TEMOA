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
import config_file as cf

# Check if the SQLite database already exists and delete it
start_time = time.time()
if cf.Deleting:
    if os.path.exists(cf.sqlite_database):
        os.remove(cf.sqlite_database)
        end_time = time.time()
        elapsed = abs(end_time - start_time)
        print("{:>62} {:>4} {:>0}".format('Existing SQLite database deleted.', np.format_float_positional(abs(elapsed), 2), 's\n'))

# Create the SQLite database and execute the SQL code(s)
start_time = time.time()
if cf.Reading:
    for sql in cf.sql_modules:
        conn = sqlite3.connect(cf.sqlite_database)
        with open(sql, mode='r', encoding='utf-8-sig') as sql_code:
            conn.executescript(sql_code.read())
        conn.commit()
        conn.close()
    end_time = time.time()
    elapsed = abs(end_time - start_time)
    print("{:>62} {:>4} {:>0}".format('SQLite database created and SQL code executed.', np.format_float_positional(abs(elapsed), 2), 's'))

# Execute the database preprocessing script
start_time = time.time()
if cf.Preprocessing:
    print('_______________________________________________________________________\n')
    print("{:>62}".format('Output code of database preprocessing:\n'))
    conn = sqlite3.connect(cf.sqlite_database)
    for idx, (table_name, interpol_param) in enumerate(cf.table_param_map.items(), 1):
        try:
            message = process_table(conn, table_name, interpol_param, cf.interpolation_method)
            print("{:>62}".format(f"[{idx}/{len(cf.table_param_map)}] {message}"))
        except Exception as e:
            print("{:>62}".format(f"[{idx}/{len(cf.table_param_map)}] Error processing table '{table_name}'--> {e}"))
    conn.commit()
    conn.close()
    
    print()
    end_time = time.time()
    elapsed = abs(end_time - start_time)
    print("{:>62} {:>4} {:>0}".format('SQLite database preprocessed.', np.format_float_positional(abs(elapsed), 2), 's'))


# Execute the projection script 
start_time = time.time()
if cf.Projecting:
    print('_______________________________________________________________________\n')
    print("{:>62}".format('Output code of sectors and usages projections:\n'))


    for idx, (table_name, interpol_param) in enumerate(cf.table_param_map.items(), 1):
        sub_start_time = time.time()
        try:
            with open(f"icaen_{table_name}_projection.py") as projecting:
                exec(projecting.read())
            sub_end_time = time.time()
            print(f"[{idx}/{len(cf.table_param_map)}] Use '{table_name}' projected in {np.format_float_positional(abs(sub_end_time - sub_start_time), 2)} seconds.")

        except Exception as e:
            print("{:>62}".format(f"[{idx}/{len(cf.table_param_map)}] Error projecting use '{table_name}'--> {e}"))

    end_time = time.time()
    elapsed = abs(end_time - start_time)
    print("{:>0} {:>62} {:>4} {:>0}".format('\n','Demand sectors projected.', np.format_float_positional(abs(elapsed), 2), 's\n'))

conn = sqlite3.connect(cf.sqlite_database)
conn.execute("VACUUM")
conn.close()