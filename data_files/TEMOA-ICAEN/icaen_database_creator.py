import os
import sqlite3

sqlite_database = 'TEMOA_ICAEN.sqlite'
sql_modules = ['TEMOA_ICAEN.sql']

Deleting = True
Reading = True
Preprocessing = True
Projecting = True

# Check if the SQLite database already exists and delete it

if Deleting:
    if os.path.exists(sqlite_database):
        os.remove(sqlite_database)
        print("{:>62}".format('Existing SQLite database deleted.'))

# Create the SQLite database and execute the SQL code(s)

if Reading:
    for sql in sql_modules:
        conn = sqlite3.connect(sqlite_database)
        with open(sql, mode='r', encoding='utf-8-sig') as sql_code:
            conn.executescript(sql_code.read())
        conn.commit()
        conn.close()
    print("{:>62}".format('SQLite database created and SQL code executed.'))

# Execute the database_preprocessing.py script

if Preprocessing:
    with open("icaen_database_preprocessing.py") as preprocessing:
        exec(preprocessing.read())
    print()
    print("{:>62}".format('SQLite database preprocessed.'))

# Simplify the SQLite database by removing the selected set of milestone years

if Projecting:
    with open("icaen_cuina_projection.py") as projecting:
        exec(projecting.read())
    print()
    print("{:>62}".format('Demand sectors projected.'))
    print()

conn = sqlite3.connect(sqlite_database)
conn.execute("VACUUM")
conn.close()