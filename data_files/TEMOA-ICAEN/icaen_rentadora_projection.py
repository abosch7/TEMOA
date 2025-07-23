"""
Model Demanda sector Domèstic (Rentadora) -- ICAEN
Manel Serrano Borja <mserrano@irec.cat>, ESA
Antoni Bosch Pons <abosch@irec.cat>, ESA
"""

import numpy as np
import pandas as pd
import sqlite3
import time
from pyomo.environ import *
import pyomo.environ as py
from pao.pyomo import *

conn = sqlite3.connect("TEMOA_ICAEN.sqlite")

class icaen_rentadora_projection:
    def __init__(self, name=None):

        # Scalar Parameters
        self.WPY = 52                    # Number of meals per day per person

    def read(self, dir):
        conn = sqlite3.connect(dir)
        

        self.pERHAB = pd.read_sql("SELECT VALUE, T_SLICES FROM rentadora WHERE PARAM = 'PERHAB'", conn)
        self.cANVRENT = pd.read_sql("SELECT VALUE, T_SLICES, SCEN FROM rentadora WHERE PARAM = 'CANVRENT'", conn)
        self.dRENT = pd.read_sql("SELECT VALUE, T_SLICES, SCEN, RENT FROM rentadora WHERE PARAM = 'DRENT'", conn)
        self.cONSRENT = pd.read_sql("SELECT VALUE, RENT FROM rentadora WHERE PARAM = 'CONSRENT'", conn)
        self.nRENTP = pd.read_sql("SELECT VALUE, T_SLICES, SCEN FROM rentadora WHERE PARAM = 'NRENTP'", conn)

    def model(self):

        ## -- CREATE A MODEL OBJECT -- ##
        model = py.ConcreteModel(name='icaen_rentadora_projection')


        ## -- SETS -- ##
        time_periods = pd.read_sql("SELECT * FROM time_slices", conn)  
        time_periods = time_periods.sort_values(by=['T_SLICES'], ignore_index=True)
        time_periods = list(time_periods.T_SLICES)

        time_base_year = time_periods[0:1]
        time_no_base_year = time_periods[1:]

        escenaris = pd.read_sql("SELECT * FROM escenaris", conn)  
        escenaris = escenaris.sort_values(by=['SCEN'], ignore_index=True)
        escenaris = list(escenaris.SCEN)

        rentats = pd.read_sql("SELECT * FROM rentats", conn)  
        rentats = rentats.sort_values(by=['RENT'], ignore_index=True)
        rentats = list(rentats.RENT)

        model.T = py.Set(initialize=time_periods)
        model.T_base = py.Set(initialize=time_base_year)
        model.T_no_base = py.Set(initialize=time_no_base_year)
        model.S = py.Set(initialize=escenaris)
        model.R = py.Set(initialize=rentats)

        ## -- MATRIXC PARAMETERS -- ##

        def pERHAB_rule(model,t):
            return self.pERHAB[self.pERHAB['T_SLICES'] == t]['VALUE'].iloc[0]
        model.pERHAB = py.Param(model.T, rule=pERHAB_rule)

        def cANVRENT_rule(model,t,s):
            return self.cANVRENT[(self.cANVRENT['T_SLICES'] == t) & (self.cANVRENT['SCEN'] == s)]['VALUE'].iloc[0]
        model.cANVRENT = py.Param(model.T, model.S, rule=cANVRENT_rule)

        def dRENT_rule(model,t,s,r):
            return self.dRENT[(self.dRENT['T_SLICES'] == t) & (self.dRENT['SCEN'] == s)& (self.dRENT['RENT'] == r)]['VALUE'].iloc[0]
        model.dRENT = py.Param(model.T, model.S, model.R, rule=dRENT_rule)

        def cONSRENT_rule(model,r):
            return self.cONSRENT[self.cONSRENT['RENT'] == r]['VALUE'].iloc[0]
        model.cONSRENT = py.Param(model.R, rule=cONSRENT_rule)

        def nRENTP_rule(model,t,s):
            return self.nRENTP[(self.nRENTP['T_SLICES'] == t) & (self.nRENTP['SCEN'] == s)]['VALUE'].iloc[0]
        model.nRENTP = py.Param(model.T, model.S, rule=nRENTP_rule)

        ## -- VARIABLES -- ##
        model.q_rent_final      = py.Var(model.T, model.S, model.R, domain = py.NonNegativeReals)
        model.q_rent_final_hat  = py.Var(model.T, model.S, domain = py.NonNegativeReals)
        model.q_rent_year       = py.Var(model.T, model.S, domain = py.NonNegativeReals)
        
        ######### -- DEFINE RENTADORA MODEL DOMESTIC SECTOR -- #########

        ## -- OBJECTIVE FUNCION RENTADORA MODEL DOMESTIC SECTOR -- ##
        def Fun_obj(model):
            return (sum(model.q_rent_final[t,s,r]for t in model.T for s in model.S for r in model.R))
        model.FunObj = py.Objective(rule = Fun_obj, sense = py.minimize)

        ## -- CONSTRAINTS RENTADORA MODEL DOMESTIC SECTOR -- ##
        
        # C1: Establishing the final energy consumption for base year
        def get_cons_base_year(model,t,s,r):
            return model.q_rent_final[t,s,r] == model.cONSRENT[r]
        model.cons_base_year = py.Constraint(model.T_base, model.S, model.R, rule = get_cons_base_year)

        # C2: Establishing the final energy consumption for projection years
        def get_cons_projection_year(model,t,s,r):
            return model.q_rent_final[t,s,r] == model.q_rent_final[t-1,s,r]*(1 + model.cANVRENT[t,s])
        model.cons_projection_year = py.Constraint(model.T_no_base, model.S, model.R, rule = get_cons_projection_year)

        # C3: Calculating the mean energy final consumption based on energy washing programs distribution
        def get_cons_mean_final_consumption(model,t,s):
            return model.q_rent_final_hat[t,s] == sum(model.q_rent_final[t,s,r]*model.dRENT[t,s,r] for r in model.R)
        model.cons_mean_final_consumption = py.Constraint(model.T, model.S, rule = get_cons_mean_final_consumption)

        #C4: Calculating the mean final energy consumption per household and year
        def get_cons_yearly_mean_final_consumption(model,t,s):
            return model.q_rent_year[t,s] == model.q_rent_final_hat[t,s]*model.pERHAB[t]*model.nRENTP[t,s]*self.WPY
        model.cons_yearly_mean_final_consumption = py.Constraint(model.T, model.S, rule = get_cons_yearly_mean_final_consumption)


        model.write('icaen_rentadora_projection.lp', io_options={'symbolic_solver_labels': True})
        return model.create_instance()

    def RunModel(self):
        
        model = self.model()

        
        with Solver("glpk") as solver:
            solver.solve(model, tee=False)

    #     INICI ESCRIPTURA  
        data = []

        for t in model.T:
            for s in model.S:

                # q_rent_final_hat variable
                q_rent_final_hat = py.value(model.q_rent_final_hat[t, s])
                data.append({
                    'VAR':"q_rent_final_hat",
                    'T_SLICES': t,
                    'SCEN': s,
                    'PRODU': None,
                    'VALUE': q_rent_final_hat,
                    'UNITATS': 'KWH/HABITATGE'
                })

                # q_rent_year variable
                q_rent_year = py.value(model.q_rent_year[t, s])
                data.append({
                    'VAR':"q_rent_year",
                    'T_SLICES': t,
                    'SCEN': s,
                    'PRODU': None,
                    'VALUE': q_rent_year,
                    'UNITATS': 'KWH/HABITATGE'
                })
                for r in model.R:

                    # q_rent_final variable
                    q_rent_final = py.value(model.q_rent_final[t, s, r])
                    data.append({
                        'VAR':"q_rent_final",
                        'T_SLICES': t,
                        'SCEN': s,
                        'PRODU': r,
                        'VALUE': q_rent_final,
                        'UNITATS': 'KWH/rentat'
                })
        data = pd.DataFrame(data)
        data.to_sql('rentadora_results', conn, index=False, if_exists='replace')
    
if __name__ == "__main__":
    mod = icaen_rentadora_projection()
    mod.read("TEMOA_ICAEN.sqlite")
    mod.RunModel()