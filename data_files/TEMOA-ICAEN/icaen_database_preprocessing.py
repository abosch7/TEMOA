"""
Arxiu de preprocessat de base de dades -- ICAEN
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

    # Read and open time_slices table
    time_periods = pd.read_sql("SELECT * FROM time_slices", conn)
    time_periods = sorted(time_periods.T_SLICES)

    # Load the working preprocessing table
    df = pd.read_sql(f"SELECT * FROM {table_name}", conn)

    # Validate the table has mandatory data
    required_cols = ['PARAM', 'SCEN', 'T_SLICES', 'VALUE', 'FLAG']
    for col in required_cols:
        if col not in df.columns:
            raise ValueError(f"Missing required column '{col}' in table '{table_name}'.")

    # Generate indexes by using non mandatory sets
    index_cols = [col for col in df.columns if col not in ['T_SLICES', 'VALUE', 'UNITATS', 'FLAG']]

    # Select parameters to interpolate
    df['INTERPOLATE'] = df['PARAM'].isin(interpol_param)

    # Include indexes in dataframe
    df['GROUP_KEY'] = df[index_cols].astype(str).agg('|'.join, axis=1)

    # Check interpolation method
    allowed_methods = ['linear', 'nearest', 'quadratic', 'cubic']
    if interpolation_method not in allowed_methods:
        raise ValueError(f"Interpolation method '{interpolation_method}' is not supported. Choose from {allowed_methods}.")

    result = []

    # Processing each parameter
    for group_key, group_df in df.groupby('GROUP_KEY'):
        interpolate = group_df['INTERPOLATE'].iloc[0]
        group_df = group_df.sort_values('T_SLICES').reset_index(drop=True)

        if not interpolate:
            result.extend(group_df.drop(columns=['GROUP_KEY', 'INTERPOLATE']).to_dict(orient='records'))
            continue

        ts_existing = group_df['T_SLICES'].to_numpy()
        values_existing = group_df['VALUE'].to_numpy()

        if len(ts_existing) < 2:
            # Extrapolating the same value
            for t in [t for t in time_periods if t >= ts_existing[0]]:
                new_row = group_df.iloc[0].copy()
                new_row['T_SLICES'] = t
                result.append(new_row.drop(labels=['GROUP_KEY', 'INTERPOLATE']).to_dict())
                if t in ts_existing:
                    new_row['FLAG'] = 0
                else:
                    new_row['FLAG'] = 1
            continue

        # Interpolating using scipy function
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
            if t in ts_existing:
                new_row['FLAG'] = 0
            else:
                new_row['FLAG'] = 1
            result.append(new_row.drop(labels=['GROUP_KEY', 'INTERPOLATE']).to_dict())

    # Generate final dataframe
    new_df = pd.DataFrame(result)
    sort_keys = ['PARAM', 'SCEN', 'T_SLICES'] + [col for col in index_cols if col not in ['PARAM', 'SCEN']]
    new_df = new_df.sort_values(by=sort_keys, ignore_index=True)

    # Save new interpolated/extrapolated data frame to database
    new_df.to_sql(table_name, conn, index=False, if_exists='replace')

    end_time = time.time()
    elapsed = abs(end_time - start_time)

    # Print table result and time execution
    return f"Table '{table_name}' calculated and interpolated ({interpolation_method}) in {elapsed:.2f} seconds."