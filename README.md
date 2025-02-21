# TEMOA
## Model features

This is an extended version of the [TEMOA](https://temoacloud.com/) (Tools for Energy Modeling Optimization and Analysis) energy system modeling framework.

This model version is maintained by the by the [MAHTEP Group](http://www.mahtep.polito.it/) at the Department of Energy of [Politecnico di Torino](https://www.polito.it/) and at the Department of Economics and Statistic of [Università degli Studi di Torino](https://www.unito.it/).
The group is lead by Prof. [Laura Savoldi](http://www.mahtep.polito.it/people/coordinators/savoldi_laura) ad Prof. [Valeria di Cosmo](http://www.mahtep.polito.it/people/coordinators/di_cosmo_valeria). For any communication related to this TEMOA version, please write to [matteo.nicoli@polito.it](mailto:matteo.nicoli@polito.it).

The public model instances based on this TEMOA version are:
* [TEMOA-Europe](https://github.com/MAHTEP/TEMOA-Europe)
* [TEMOA-Italy](https://github.com/MAHTEP/TEMOA-Italy)
* [TEMOA-Piedmont](https://github.com/MAHTEP/TEMOA-Piedmont)

Below, the list of publications in which this version was used:
1. A. Vai, G. Colucci, M. Nicoli, and L. Savoldi, “May the availability of critical raw materials affect the security of energy systems? An analysis for risk-aware energy planning with TEMOA-Italy,” Mater Today Energy, vol. 48, no. 101805, 2025, doi: 10.1016/j.mtener.2025.101805.
2. F. Amir Kavei, M. Nicoli, F. Quatraro, and L. Savoldi, “Enhancing energy transition with open-source regional energy system optimization models: TEMOA-Piedmont,” Energy Convers Manag, vol. 327, p. 119536, Mar. 2025, doi: 10.1016/J.ENCONMAN.2025.119536.
3. M. Nicoli, G. Colucci, V. Di Cosmo, D. Lerede, and L. Savoldi, “Evaluating the impact of hurdle rates on the Italian energy transition through TEMOA,” Appl Energy, vol. 377PC, no. 124633, 2024, doi: 10.1016/j.apenergy.2024.124633.
4. M. Nicoli, V. A. D. Faria, A. R. de Queiroz, and L. Savoldi, “Modeling energy storage in long-term capacity expansion energy planning: an analysis of the Italian system,” J Energy Storage, vol. 101PA, no. 113814, 2024, doi: 10.1016/j.est.2024.113814.
5. M. Nicoli et al., “Enabling Coherence Between Energy Policies and SDGs Through Open Energy Models: The TEMOA-Italy Example,” in Aligning the Energy Transition with the Sustainable Development Goals: Key Insights from Energy System Modelling, M. Labriet, K. Espegren, G. Giannakidis, and B. O’Gallachoir, Eds., Springer, 2024, pp. 97–118. doi: 10.1007/978-3-031-58897-6_5.
6. D. Mosso, G. Colucci, D. Lerede, M. Nicoli, M. S. Piscitelli, and L. Savoldi, “How much do carbon emission reduction strategies comply with a sustainable development of the power sector?,” Energy Reports, vol. 11, pp. 3064–3087, Jun. 2024, doi: 10.1016/J.EGYR.2024.02.056.
7. G. Colucci, D. Lerede, M. Nicoli, and L. Savoldi, “A dynamic accounting method for CO2 emissions to assess the penetration of low-carbon fuels: application to the TEMOA-Italy energy system optimization model,” Appl Energy, vol. 352, no. 121951, Dec. 2023, doi: 10.1016/j.apenergy.2023.121951.
8. D. Lerede, M. Nicoli, L. Savoldi, and A. Trotta, “Analysis of the possible contribution of different nuclear fusion technologies to the global energy transition,” Energy Strategy Reviews, vol. 49, no. 101144, Sep. 2023, doi: 10.1016/j.esr.2023.101144.
9. M. Nicoli, “A TIMES-like open-source model for the Italian energy system,” Politecnico di Torino, Turin, 2021. Accessed: Jul. 05, 2022. [Online]. Available: https://webthesis.biblio.polito.it/18850/
10. M. Nicoli, F. Gracceva, D. Lerede, and L. Savoldi, “Can We Rely on Open-Source Energy System Optimization Models? The TEMOA-Italy Case Study,” Energies (Basel), vol. 15, no. 18, p. 6505, Sep. 2022, doi: 10.3390/en15186505.


# Overview

The 'energysystem' branch is the current master branch of
Temoa.  The four subdirectories are:

1. `temoa_model/`
Contains the core Temoa model code.

2. `data_files/`
Contains simple input data (DAT) files for Temoa. Note that the file 
'utopia-15.dat' represents a simple system called 'Utopia', which 
is packaged with the MARKAL model generator and has been used 
extensively for benchmarking exercises.

3. `data_processing/`
Contains several modules to make output graphs, network diagrams, and 
results spreadsheets.

3. `tools/`
Contains scripts used to conduct sensitivity and uncertainty analysis. 
See the READMEs inside each subfolder for more information.

4. `docs/`
Contains the source code for the Temoa project manual, in reStructuredText
(ReST) format.

## Creating a Temoa Environment

Temoa requires several software elements, and it is most convenient to create 
a conda environment in which to run the model. To begin, you need to have conda 
installed either via miniconda or anaconda. Next, download the environment.yml file.
From the command line:

```$ conda env create```

Then activate the environment as follows:

```$ source activate temoa-py3```

This new conda environment contains several elements, including Python 3, a 
compatible version of Pyomo, matplotlib, numpy, scipy, and two free solvers 
(GLPK and CBC). A note for Windows users: the CBC solver is not available for Windows through conda. Thus, in order to install the environment properly, the last line of the 'environment.yml' file specifying 'coincbc' should be deleted.

To download the Temoa source code, either clone the repository or download from GitHub 
as a zip file.

## Running Temoa

To run Temoa, you have a few options. All commands below should be executed from the 
top-level 'temoa' directory.

**Option 1 (full-featured):**
Invokes python directly, and gives the user access to 
several model features via a configuration file:

```$ python  temoa_model/  --config=temoa_model/config_sample```

Running the model with a config file allows the user to (1) use a sqlite 
database for storing input and output data, (2) create a formatted Excel 
output file, (2) specify the solver to use, (3) return the log file produced during model execution, (4) return the lp file utilized by the solver, and (5) to execute modeling-to-generate alternatives (MGA). Note that if you do not have access to a commercial solver, it may be faster run cplex on the NEOS server. To do so, simply specify cplex as the solver and uncomment the '--neos' flag.


**Option 2 (basic):**
Uses Pyomo's own scripts and provides basic solver output:

```$ pyomo solve --solver=<solver> temoa_model/temoa_model.py  path/to/dat/file```

This option will only work with a text ('DAT') file as input. 
Results are placed in a yml file within the top-level 'temoa' directory.


**Option 3 (basic +):**
Copies the relevant Temoa model files into an executable archive 
(this only needs to be done once):

```$ python create_archive.py```

This makes the model more portable by placing all contents in a 
single zipped file. Now it is possible to execute the model with the 
following simply command:

```$ python temoa.py  path/to/dat/file```

For general help use --help:

```$ python  temoa_model/  --help```



