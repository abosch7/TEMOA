import pandas as pd
import numpy as np
import time
import sqlite3
from scipy.interpolate import interp1d

def process_table(conn, table_name, interpol_param, save_tosql, print_outcome, interpolation_method='linear'):
    print_i = 0
    print_status = True

    # Cargar los periodos de tiempo
    time_periods = pd.read_sql("SELECT * FROM time_slices", conn)
    time_periods = sorted(time_periods.T_SLICES)

    print('_______________________________________________________________________\n')
    print("{:>62}".format('Output code of database_preprocessing.py:\n'))

    start_time = time.time()

    # Cargar la tabla seleccionada
    df = pd.read_sql(f"SELECT * FROM {table_name}", conn)

    # Verificar que existan las columnas necesarias
    required_cols = ['PARAM', 'SCEN', 'T_SLICES', 'VALUE', 'UNITATS', 'FLAG']
    for col in required_cols:
        if col not in df.columns:
            raise ValueError(f"Missing required column '{col}' in table '{table_name}'.")

    # Detectar columnas de índice dinámicamente
    index_cols = [col for col in df.columns if col not in ['T_SLICES', 'VALUE', 'UNITATS', 'FLAG']]

    # Marcar si se debe interpolar
    df['INTERPOLATE'] = df['PARAM'].isin(interpol_param)

    # Crear clave de grupo única
    df['GROUP_KEY'] = df[index_cols].astype(str).agg('|'.join, axis=1)

    result = []

    # Validar método de interpolación
    allowed_methods = ['linear', 'nearest', 'quadratic', 'cubic']
    if interpolation_method not in allowed_methods:
        raise ValueError(f"Interpolation method '{interpolation_method}' is not supported. Choose from {allowed_methods}.")

    # Procesar grupo por grupo
    for group_key, group_df in df.groupby('GROUP_KEY'):
        interpolate = group_df['INTERPOLATE'].iloc[0]
        group_df = group_df.sort_values('T_SLICES').reset_index(drop=True)

        if not interpolate:
            result.extend(group_df.drop(columns=['GROUP_KEY', 'INTERPOLATE']).to_dict(orient='records'))
            continue

        ts_existing = group_df['T_SLICES'].to_numpy()
        values_existing = group_df['VALUE'].to_numpy()

        if len(ts_existing) < 2:
            # Si no hay suficientes puntos para interpolar, solo replicamos
            for t in [t for t in time_periods if t >= ts_existing[0]]:
                new_row = group_df.iloc[0].copy()
                new_row['T_SLICES'] = t
                new_row['FLAG'] = 1
                result.append(new_row.drop(labels=['GROUP_KEY', 'INTERPOLATE']).to_dict())
            continue

        # Crear función de interpolación
        interp_func = interp1d(
            ts_existing,
            values_existing,
            kind=interpolation_method,
            fill_value="extrapolate",
            bounds_error=False
        )

        for t in time_periods:
            new_row = group_df.iloc[0].copy()  # Usamos cualquier fila del grupo como plantilla
            new_row['T_SLICES'] = t
            new_row['VALUE'] = float(interp_func(t))
            new_row['FLAG'] = 1
            result.append(new_row.drop(labels=['GROUP_KEY', 'INTERPOLATE']).to_dict())

    # Construir DataFrame final
    new_df = pd.DataFrame(result)
    sort_keys = ['PARAM', 'SCEN', 'T_SLICES'] + [col for col in index_cols if col not in ['PARAM', 'SCEN']]
    new_df = new_df.sort_values(by=sort_keys, ignore_index=True)

    # Guardar en base de datos si se solicita
    if save_tosql.get(table_name, False):
        new_df.to_sql(table_name, conn, index=False, if_exists='replace')

    # Imprimir resultado si se solicita
    if print_outcome.get(table_name, False):
        pd.set_option('display.max_rows', len(new_df))
        pd.set_option('display.max_columns', 10)
        print(f"\n{table_name} DataFrame\n\n", new_df.head(1000))
        pd.reset_option('display.max_rows')
        pd.reset_option('display.max_columns')

    end_time = time.time()

    if print_status:
        print("{:>1} {:>2} {:>1} {:>2} {:>1} {:>50} {:>6} {:>1}".format(
            '[', print_i + 1, '/', len(print_outcome), ']',
            f'{table_name} table calculated and interpolated ({interpolation_method}).',
            np.format_float_positional(abs(end_time - start_time), 2), 's'))





# Crida de la funció 


conn = sqlite3.connect("TEMOA_ICAEN.sqlite")
table_name = 'cuina'
interpol_param = ['PRESAP', 'CANVAP', 'REPFORM', 'REND']
save_tosql = {'cuina': True}
print_outcome = {'cuina': False}
interpolation_method = 'nearest'


# Llama a la función con esos argumentos
process_table(conn, table_name, interpol_param, save_tosql, print_outcome, interpolation_method)

# No olvides cerrar la conexión cuando termines
conn.close()