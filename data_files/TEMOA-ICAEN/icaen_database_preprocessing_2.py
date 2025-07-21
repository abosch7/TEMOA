import pandas as pd
import numpy as np
import sqlite3
import time

# ----------------------------- #
# Cargar conexión y parámetros #
# ----------------------------- #

conn = sqlite3.connect("TEMOA_ICAEN.sqlite")

interpol_param = ['PRESAP', 'CANVAP', 'REPFORM', 'REND']  # Parámetros a interpolar

save_tosql = {'cuina': True}
print_outcome = {'cuina': False}
print_status = True

# Cargar periodos temporales
time_periods = pd.read_sql("SELECT * FROM time_slices", conn).sort_values(by='T_SLICES', ignore_index=True)
time_periods = list(time_periods.T_SLICES)

# ------------------------ #
# Función de interpolación #
# ------------------------ #

def interpolate_table(conn, table_name, interpol_param, time_periods, save=True, print_result=False):
    start_time = time.time()

    # Leer tabla
    data_selection = pd.read_sql(f"SELECT * FROM {table_name}", conn)

    # Crear contenedor de columnas dinámico
    columns_output = {col: [] for col in data_selection.columns}
    columns_output['FLAG'] = []

    # Crear índice combinando claves relevantes
    def create_index(row):
        try:
            return str(row.PARAM) + str(row.SCEN) + str(row.PRODU) if row.PARAM in interpol_param else 'NONE'
        except AttributeError:
            return 'NONE'

    data_selection['INDEXES'] = data_selection.apply(create_index, axis=1)
    indexes = data_selection['INDEXES'].unique()

    # Interpolación/extrapolación
    for index_i in indexes:
        data_i = data_selection[data_selection['INDEXES'] == index_i].sort_values(by='T_SLICES').reset_index(drop=True)

        if index_i == 'NONE':
            for _, row in data_i.iterrows():
                for col in data_selection.columns:
                    columns_output[col].append(row[col])
                columns_output['FLAG'].append(row.get('FLAG', 0))
        else:
            for i in range(len(data_i) - 1):
                row_i = data_i.iloc[i]
                row_ip1 = data_i.iloc[i + 1]

                # Periodos entre los dos puntos
                t_i = row_i.T_SLICES
                t_ip1 = row_ip1.T_SLICES
                time_range = [t for t in time_periods if t_i <= t < t_ip1]

                for j, t in enumerate(time_range):
                    if j == 0:
                        for col in data_selection.columns:
                            columns_output[col].append(row_i[col])
                        columns_output['FLAG'].append(row_i.get('FLAG', 0))
                    else:
                        val_interp = float(row_i.VALUE + (row_ip1.VALUE - row_i.VALUE) * (t - t_i) / (t_ip1 - t_i))
                        for col in data_selection.columns:
                            if col == 'T_SLICES':
                                columns_output[col].append(t)
                            elif col == 'VALUE':
                                columns_output[col].append(val_interp)
                            else:
                                columns_output[col].append(row_i[col])
                        columns_output['FLAG'].append(1)

            # Extrapolación del último punto hacia adelante
            row_last = data_i.iloc[-1]
            t_last = row_last.T_SLICES
            time_future = [t for t in time_periods if t >= t_last]

            for t in time_future:
                for col in data_selection.columns:
                    if col == 'T_SLICES':
                        columns_output[col].append(t)
                    else:
                        columns_output[col].append(row_last[col])
                columns_output['FLAG'].append(1)

    # Crear nuevo DataFrame interpolado
    result_df = pd.DataFrame(columns_output)

    # Limpiar columna auxiliar
    result_df.drop(columns='INDEXES', inplace=True, errors='ignore')

    # Ordenar columnas
    result_df = result_df.sort_values(by=['PARAM', 'SCEN', 'T_SLICES', 'PRODU'], ignore_index=True)

    # Guardar en la base de datos
    if save:
        result_df.to_sql(table_name, conn, index=False, if_exists='replace')

    # Imprimir resultados
    if print_result:
        pd.set_option('display.max_rows', len(result_df))
        pd.set_option('display.max_columns', None)
        print(f"\nTabla {table_name} después de interpolar:\n", result_df)
        pd.reset_option('display.max_rows')
        pd.reset_option('display.max_columns')

    # Tiempo de ejecución
    end_time = time.time()
    if print_status:
        print(f"[✔] {table_name} interpolada y procesada en {end_time - start_time:.2f} s")

    return result_df

# ------------------------------ #
# Ejemplo: interpolar tabla cuina #
# ------------------------------ #

interpolate_table(
    conn=conn,
    table_name='cuina',
    interpol_param=interpol_param,
    time_periods=time_periods,
    save=save_tosql['cuina'],
    print_result=print_outcome['cuina']
)
