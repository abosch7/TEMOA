"""
Model Demanda sector Domèstic (Cuina) -- ICAEN
Manel Serrano Borja <mserrano@irec.cat>, ESA
Antoni Bosch Pons <abosch@irec.cat>, ESA
"""

import numpy as np
import pandas as pd
import sqlite3
import time
from pyomo.environ import *
import pyomo.environ as py
from pyomo.opt import SolverFactory

conn = sqlite3.connect("TEMOA_ICAEN.sqlite")

class icaen_cuina_projection:
    def __init__(self, name=None):

        # Scalar Parameters
        self.DPY = 3          # Number of days per year
        self.NAP = 2                    # Number of meals per day per person

    def read(self, dir):
        conn = sqlite3.connect(dir)
        
        self.cONGN = pd.read_sql("SELECT VALUE, T_SLICES FROM cuina WHERE PARAM = 'CONGN'", conn)
        self.pRESAP = pd.read_sql("SELECT VALUE, T_SLICES, SCEN FROM cuina WHERE PARAM = 'PRESAP'", conn)
        self.cANVAP = pd.read_sql("SELECT VALUE, T_SLICES, SCEN FROM cuina WHERE PARAM = 'CANVAP'", conn)
        self.rEND = pd.read_sql("SELECT VALUE, T_SLICES, SCEN, PRODU FROM cuina WHERE PARAM = 'REND'", conn)
        self.pERHAB = pd.read_sql("SELECT VALUE, T_SLICES FROM cuina WHERE PARAM = 'PERHAB'", conn)
        self.rEPFORM = pd.read_sql("SELECT VALUE, T_SLICES, SCEN, PRODU FROM cuina WHERE PARAM = 'REPFORM'", conn)

    def model(self):
        #print(self.cONGN)
        #print(self.cONGN[self.cONGN['T_SLICES'] == 2011]['VALUE'].iloc[0])

        ## -- CREATE A MODEL OBJECT -- ##
        model = py.ConcreteModel(name='icaen_cuina_projection')


        ## -- SETS -- ##
        time_periods = pd.read_sql("SELECT * FROM time_slices", conn)  
        time_periods = time_periods.sort_values(by=['T_SLICES'], ignore_index=True)
        time_periods = list(time_periods.T_SLICES)

        time_periods_past = pd.read_sql("SELECT * FROM time_slices WHERE PAST = 1", conn) 
        time_periods_past = time_periods_past.sort_values(by=['T_SLICES'], ignore_index=True)
        time_periods_past = list(time_periods_past.T_SLICES)

        time_periods_future = pd.read_sql("SELECT * FROM time_slices WHERE PAST = 0", conn) 
        time_periods_future = time_periods_future.sort_values(by=['T_SLICES'], ignore_index=True)
        time_periods_future = list(time_periods_future.T_SLICES)

        time_base_year = [time_periods[0:1]]
        time_no_base_year = [time_periods[1:]]

        escenaris = pd.read_sql("SELECT * FROM escenaris", conn)  
        escenaris = escenaris.sort_values(by=['SCEN'], ignore_index=True)
        escenaris = list(escenaris.SCEN)

        productes = pd.read_sql("SELECT * FROM productes", conn)  
        productes = productes.sort_values(by=['PRODU'], ignore_index=True)
        productes = list(productes.PRODU)

        model.T = py.Set(initialize=time_periods)
        model.T0 = py.Set(initialize=time_periods_past)
        model.T1 = py.Set(initialize=time_periods_future)
        model.T_base = py.Set(initialize=time_base_year)
        model.T_no_base = py.Set(initialize=time_no_base_year)
        model.S = py.Set(initialize=escenaris)
        model.P = py.Set(initialize = productes)
        print(list(model.T0))


        ## -- MATRIXC PARAMETERS -- ##
        def cONGN_rule(model,t):
            return self.cONGN[self.cONGN['T_SLICES'] == t]['VALUE'].iloc[0]
        model.cONGN = py.Param(model.T0, rule=cONGN_rule)

        def pRESAP_rule(model,t,s):
            return self.pRESAP[(self.pRESAP['T_SLICES'] == t) & (self.pRESAP['SCEN'] == s)]['VALUE'].iloc[0]
        model.pRESAP = py.Param(model.T, model.S, rule=pRESAP_rule)

        def cANVAP_rule(model,t,s):
            return self.cANVAP[(self.cANVAP['T_SLICES'] == t) & (self.cANVAP['SCEN'] == s)]['VALUE'].iloc[0]
        model.cANVAP = py.Param(model.T, model.S, rule=cANVAP_rule)

        def rEND_rule(model,t,s,p):
            return self.rEND[(self.rEND['T_SLICES'] == t) & (self.rEND['SCEN'] == s)& (self.rEPFORM['PRODU'] == p)]['VALUE'].iloc[0]
        model.rEND = py.Param(model.T, model.S, model.P, rule=rEND_rule)

        def pERHAB_rule(model,t):
            return self.pERHAB[self.pERHAB['T_SLICES'] == t]['VALUE'].iloc[0]
        model.pERHAB = py.Param(model.T0, rule=pERHAB_rule)

        def rEPFORM_rule(model,t,s,p):
            return self.rEPFORM[(self.rEPFORM['T_SLICES'] == t) & (self.rEPFORM['SCEN'] == s) & (self.rEPFORM['PRODU'] == p)]['VALUE'].iloc[0]
        model.rEPFORM = py.Param(model.T, model.S, model.P, rule=rEPFORM_rule)

        ## -- VARIABLES -- ##

        model.q_GN = py.Var(domain = py.NonNegativeReals)
        model.q_ind = py.Var(model.T, model.S, domain = py.NonNegativeReals)
        model.q_hab = py.Var(model.T, model.S, domain = py.NonNegativeReals)
        model.q_final  = py.Var(model.T, model.S, domain = py.NonNegativeReals)
        model.q_end  = py.Var(model.T, model.S, model.P, domain = py.NonNegativeReals)
        
        ######### -- DEFINE CUINA MODEL DOMESTIC SECTOR -- #########

        ## -- OBJECTIVE FUNCION CUINA MODEL DOMESTIC SECTOR -- ##
        def Fun_obj(model):
            return (sum(model.q_end[t,s,p] for t in model.T for s in model.S for p in model.P))
        model.FunObj_up = py.Objective(rule = Fun_obj, sense = py.maximize)

        ## -- CONSTRAINTS CUINA MODEL DOMESTIC SECTOR -- ##
        
        # C1: Calculating the mean value of GN with data aviable
        def get_cons_mean_GN_calc(model):
            return model.q_GN == (sum(model.cONGN[t] for t in model.T0))/(len(model.T0))
        model.cons_mean_GN_calc = py.Constraint(rule = get_cons_mean_GN_calc)

        # C2: Calculating the consumption of GN per meal for base year.
        def get_cons_meal_GN_base_calc(model,t,s):
            return model.q_ind[t,s] == (model.q_GN * model.rEND[t,s,"GN"])/(self.DPY * self.NAP * model.pRESAP[t,s] * model.pERHAB[t])
        model.cons_meal_GN_base_calc = py.Constraint(model.T_base, model.S, rule = get_cons_meal_GN_base_calc)

        # C3: Calculating the consumption of GN per meal for hole years
        # def get_cons_meal_GN_calc(model,t,s):
        #     return model.q_ind[t,s] == model.q_ind[t-1,s]*(1+ model.cANVAP[t,s])
        # model.cons_meal_GN_calc = py.Constraint(model.T_no_base, model.S, rule = get_cons_meal_GN_calc)

        model.write('icaen_cuina_projection.lp', io_options={'symbolic_solver_labels': True})
        return model.create_instance()


    def RunModel(self):
        
        model = self.model()

    #     print("Model Creat")

    #     print("Iniciant resolucio")
    #     with Solver('pao.pyomo.PCCG',mip_solver="gurobi") as solver:
    #         results = solver.solve(model, tee=True)

    #     opt = py.SolverFactory("solvers/scipampl")
    #     results = opt.solve(model)
    #     print("Resolucio OK")

    #     OF_value_up = round(value(model.FunObj_up),4)
    #     OF_value_down = round(value(model.L.FunObj_down),4)
    #     print(OF_value_up)
    #     print(OF_value_down)
    #     print(model.cost_inv.value)

    #     INICI ESCRIPTURA  
    #     import pandas as pd
    #     print("Iniciant escriptura")
    #     filename = 'myfile.xlsx'
    #     writer = pd.ExcelWriter(filename, engine='xlsxwriter')

    #     Escriptura y
    #     nn = 0
    #     df = pd.DataFrame(columns=['n', 't', 'value'])
    #     for n in model.y.keys():
    #         val = py.value(model.y[n])
    #         df.loc[nn] = [n[0], n[1], val]
    #         nn+=1
    #     df.to_excel(writer, sheet_name='Y', index=None)

    #     Escriptura V2G_in
    #     nn = 0
    #     df = pd.DataFrame(columns=['n', 't', 'h', 'value'])
    #     for n in model.V2G_in.keys():
    #         val = py.value(model.V2G_in[n])
    #         print("x[{}] = {}".format(n, val))
    #         df.loc[nn] = [n[0], n[1], n[2], val]
    #         nn+=1
    #     df.to_excel(writer, sheet_name='V2G_IN', index=None)

    #     Escriptura V2G_out
    #     nn = 0
    #     df = pd.DataFrame(columns=['n', 't', 'h', 'value'])
    #     for n in model.V2G_out.keys():
    #         val = py.value(model.V2G_out[n])
    #         print("x[{}] = {}".format(n, val))
    #         df.loc[nn] = [n[0], n[1], n[2], val]
    #         nn+=1
    #     df.to_excel(writer, sheet_name='V2G_OUT', index=None)

    #     Escriptura N_TOTAL
    #     nn = 0
    #     df = pd.DataFrame(columns=['n', 't', 'h', 'value'])
    #     for n in model.N_total.keys():
    #         val = py.value(model.N_total[n])
    #         print("x[{}] = {}".format(n, val))
    #         df.loc[nn] = [n[0], n[1], n[2], val]
    #         nn+=1
    #     df.to_excel(writer, sheet_name='N_TOTAL', index=None)

    #     Escriptura p_v2g_c
    #     nn = 0
    #     df = pd.DataFrame(columns=['n', 't', 'h', 'value'])
    #     for n in model.p_v2g_c.keys():
    #         val = py.value(model.p_v2g_c[n])
    #         print("x[{}] = {}".format(n, val))
    #         df.loc[nn] = [n[0], n[1], n[2], val]
    #         nn+=1
    #     df.to_excel(writer, sheet_name='p_V2G_C', index=None)

    #     Escriptura p_v2g_d
    #     nn = 0
    #     df = pd.DataFrame(columns=['n', 't', 'h', 'value'])
    #     for n in model.p_v2g_d.keys():
    #         val = py.value(model.p_v2g_d[n])
    #         print("x[{}] = {}".format(n, val))
    #         df.loc[nn] = [n[0], n[1], n[2], val]
    #         nn+=1
    #     df.to_excel(writer, sheet_name='p_V2G_D', index=None)

    #     Escriptura p_IMP
    #     nn = 0
    #     df = pd.DataFrame(columns=['c', 'n', 't', 'h', 'value'])
    #     for n in model.p_IMP.keys():
    #         val = py.value(model.p_IMP[n])
    #         print("x[{}] = {}".format(n, val))
    #         df.loc[nn] = [n[0], n[1], n[2], n[3], val]
    #         nn+=1
    #     df.to_excel(writer, sheet_name='p_IMP', index=None)

    #     Escriptura p_EXP
    #     nn = 0
    #     df = pd.DataFrame(columns=['c', 'n', 't', 'h', 'value'])
    #     for n in model.p_EXP.keys():
    #         val = py.value(model.p_EXP[n])
    #         print("x[{}] = {}".format(n, val))
    #         df.loc[nn] = [n[0], n[1], n[2], n[3], val]
    #         nn+=1
    #     df.to_excel(writer, sheet_name='p_EXP', index=None)

    #     Escriptura p_grid
    #     nn = 0
    #     df = pd.DataFrame(columns=['n', 't', 'h', 'value'])
    #     for n in model.p_grid.keys():
    #         val = py.value(model.p_grid[n])
    #         print("x[{}] = {}".format(n, val))
    #         df.loc[nn] = [n[0], n[1], n[2], val]
    #         nn+=1
    #     df.to_excel(writer, sheet_name='p_GRID', index=None)

    #     Escriptura e_node
    #     nn = 0
    #     df = pd.DataFrame(columns=['n', 't', 'h', 'value'])
    #     for n in model.e_node.keys():
    #         val = py.value(model.e_node[n])
    #         print("x[{}] = {}".format(n, val))
    #         df.loc[nn] = [n[0], n[1], n[2], val]
    #         nn+=1
    #     df.to_excel(writer, sheet_name='e_node', index=None)

    #     Escriptura X_inter
    #     nn = 0
    #     df = pd.DataFrame(columns=['n', 'c','t', 'h', 'value'])
    #     for n in model.X_inter.keys():
    #         val = py.value(model.X_inter[n])
    #         print("x[{}] = {}".format(n, val))
    #         df.loc[nn] = [n[0], n[1], n[2], n[3], val]
    #         nn+=1
    #     df.to_excel(writer, sheet_name='X_inter', index=None)
        
    #     writer.close()
    #     print("Escriptura OK")

if __name__ == "__main__":
    mod = icaen_cuina_projection()
    print("Iniciant lectura")
    mod.read("TEMOA_ICAEN.sqlite")
    print("Lectura OK")

    print("Iniciant model")
    mod.RunModel()