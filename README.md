# 'moo' branch

The 'moo' branch is the starting commit of the multi-objective optimization (MOO) branch of TEMOA. It represents the first-of-a-kind TEMOA version that allows MOO and builds upon the [extended version](https://github.com/MAHTEP/TEMOA) of TEMOA developed within the MAHTEP group. The MOO is integrated as an additional module, as schematized in Figure 1. The MOO is activated through the configuration file, while the steps for solving the MOO are defined in the “temoa_run” file, which includes the execution code of the model. These steps call the equations defined in the “temoa_moo” file, which in turn imports the objective functions from “temoa_model” and “temoa_rules” files.

![](docs/TemoaModelMOO.svg)

*Figure 1. Scheme of the TEMOA modeling framework updated with the additional MOO items.*

The current and unique MOO method included in the module is the Augmented epsilon-constraint (AUGMECON) method [1]. It is a well-established method, which was developed as a reformulation of the epsilon-constraint method to ensure Pareto optimality. A solution to a MOO problem is considered Pareto optimal if improving one objective leads to the deterioration of another [1]. Let’s consider the minimization of multiple objective functions. The AUGMECON method transforms all but one objective into equality constraints. Except for the latter, each objective is first minimized individually to determine the boundaries of the Pareto front. Then, a desired number and distribution of caps within the Pareto front boundaries are selected. Finally, the MOO is solved for all the chosen caps, yielding Pareto-optimal solutions to the original MOO problem.

The AUGMECON method is comprehensively described in [1]. The first application in TEMOA was done in [2] using as a case study the Italian power sector shown in Figure 2. In particular, this analysis involved two MOO problems: firstly, the minimization of the total system cost and net CO2 emissions; secondly, the minimization of material and energy supply risk (SR) functions. The latter definition also involved the integration of two new parameters quantifying the material SR of energy technologies (i.e., "TechnologyMaterialSupplyRisk") and the energy SR of energy commodities (i.e., "EnergyCommodityConcentrationIndex"). Additionally, the 'moo' branch also includes the modeling of the raw materials value chains as in the ['materials' branch](https://github.com/MAHTEP/TEMOA-Italy/tree/materials) of TEMOA-Italy.

![](docs/PowerSector.svg)

*Figure 2. Reference energy system of the model used to test the moo module.*

## References
1. G. Mavrotas, “Effective implementation of the e-constraint method in Multi-Objective Mathematical Programming problems,” Appl Math Comput, 2009, doi: 10.1016/j.amc.2009.03.037.
2. G. Colucci, V. Bertsch, V. Di Cosmo, J. Finke, and L. Savoldi, “Combined assessment of material and energy supply risks of the energy transition: a multi-objective energy system optimization approach,” Submitted to Applied Energy, 2024.