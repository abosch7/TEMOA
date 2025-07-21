"""
Arxiu preprocessat base de dades -- ICAEN
Manel Serrano Borja <mserrano@irec.cat>, ESA
Antoni Bosch Pons <abosch@irec.cat>, ESA
"""

import pandas as pd
import numpy as np
import time
import sqlite3
from scipy.interpolate import interp1d

def process_table(conn, table_name, interpol_param, interpolation_method='linear'):
    start_time = time.time()

    # Leer tabla time_slices y ordenarla
    time_periods = pd.read_sql("SELECT * FROM time_slices", conn)
    time_periods = sorted(time_periods.T_SLICES)

    # Cargar la tabla objetivo
    df = pd.read_sql(f"SELECT * FROM {table_name}", conn)

    # Validar columnas necesarias
    required_cols = ['PARAM', 'SCEN', 'T_SLICES', 'VALUE', 'UNITATS', 'FLAG']
    for col in required_cols:
        if col not in df.columns:
            raise ValueError(f"Missing required column '{col}' in table '{table_name}'.")

    # Identificar columnas de índice
    index_cols = [col for col in df.columns if col not in ['T_SLICES', 'VALUE', 'UNITATS', 'FLAG']]

    # Marcar parámetros a interpolar
    df['INTERPOLATE'] = df['PARAM'].isin(interpol_param)

    # Crear clave de grupo
    df['GROUP_KEY'] = df[index_cols].astype(str).agg('|'.join, axis=1)

    # Validar método de interpolación
    allowed_methods = ['linear', 'nearest', 'quadratic', 'cubic']
    if interpolation_method not in allowed_methods:
        raise ValueError(f"Interpolation method '{interpolation_method}' is not supported. Choose from {allowed_methods}.")

    result = []

    # Procesar cada grupo
    for group_key, group_df in df.groupby('GROUP_KEY'):
        interpolate = group_df['INTERPOLATE'].iloc[0]
        group_df = group_df.sort_values('T_SLICES').reset_index(drop=True)

        if not interpolate:
            result.extend(group_df.drop(columns=['GROUP_KEY', 'INTERPOLATE']).to_dict(orient='records'))
            continue

        ts_existing = group_df['T_SLICES'].to_numpy()
        values_existing = group_df['VALUE'].to_numpy()

        if len(ts_existing) < 2:
            # Copiar valores sin interpolar
            for t in [t for t in time_periods if t >= ts_existing[0]]:
                new_row = group_df.iloc[0].copy()
                new_row['T_SLICES'] = t
                new_row['FLAG'] = 1
                result.append(new_row.drop(labels=['GROUP_KEY', 'INTERPOLATE']).to_dict())
            continue

        # Interpolación con scipy
        interp_func = interp1d(
            ts_existing,
            values_existing,
            kind=interpolation_method,
            fill_value="extrapolate",
            bounds_error=False
        )

        for t in time_periods:
            new_row = group_df.iloc[0].copy()
            new_row['T_SLICES'] = t
            new_row['VALUE'] = round(float(interp_func(t)),ndigits=4) 
            new_row['FLAG'] = 1
            result.append(new_row.drop(labels=['GROUP_KEY', 'INTERPOLATE']).to_dict())

    # Crear DataFrame final
    new_df = pd.DataFrame(result)
    sort_keys = ['PARAM', 'SCEN', 'T_SLICES'] + [col for col in index_cols if col not in ['PARAM', 'SCEN']]
    new_df = new_df.sort_values(by=sort_keys, ignore_index=True)

    # Guardar resultados en base de datos
    new_df.to_sql(table_name, conn, index=False, if_exists='replace')

    end_time = time.time()
    elapsed = abs(end_time - start_time)

    # En lugar de print, devolvemos la info
    return f"Table '{table_name}' calculated and interpolated ({interpolation_method}) in {elapsed:.2f} seconds."


# -------------------
# Código para procesar varias tablas con distintos parámetros
# -------------------

conn = sqlite3.connect("TEMOA_ICAEN.sqlite")

table_param_map = {
    'cuina': ['PRESAP', 'CANVAP', 'REPFORM', 'REND'],
    'rentadora': ['PRESAP', 'REND']
}

interpolation_method = 'quadratic'

print('_______________________________________________________________________\n')
print("{:>62}".format('Output code of database_preprocessing.py:\n'))

for idx, (table_name, interpol_param) in enumerate(table_param_map.items(), 1):
    try:
        message = process_table(conn, table_name, interpol_param, interpolation_method)
        print("{:>62}".format(f"[{idx}/{len(table_param_map)}] {message}"))
    except Exception as e:
        print("{:>62}".format(f"[{idx}/{len(table_param_map)}] Error al procesar la tabla '{table_name}'--> {e}"))

conn.close()
