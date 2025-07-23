"""
Arxiu de configuració -- ICAEN
Manel Serrano Borja <mserrano@irec.cat>, ESA
Antoni Bosch Pons <abosch@irec.cat>, ESA
"""

Deleting = True
Reading = True
Preprocessing = True
Projecting = True

# File names
sql_modules = ['TEMOA_ICAEN.sql']                                   # Name of the .sql data files
sqlite_database = "TEMOA_ICAEN.sqlite"                              # Name of the .sqlite datbasae

# Preprocessing
interpolation_method = 'linear'                                     # Type of interpolation applied (linear, quadratic, cubic & nearest)

# Projection
solver = 'gurobi'                                                   # Solver used for projection

# Preprocessing and projection
table_param_map = {                                                 # Table names associated with their parameters to be interpolated. Uses to be projected.
    'cuina': ['PRESAP', 'CANVAP', 'REPFORM', 'REND'],
    'rentadora': ['CANVRENT', 'DRENT', 'NRENTP'],
    'test': ['PROVA']
}