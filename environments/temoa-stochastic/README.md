# Stochastic Optimization with TEMOA

### Prerequisites
Ensure you have the following installed on your system:
- **Anaconda** or **Miniconda**: for managing the virtual environment
- **Git**: for cloning repositories if needed

### Step 1: Create the Virtual Environment
1. Open your terminal (Anaconda Prompt if using Windows).
2. Navigate to the directory containing the `temoa-stochastic.yml` file.
3. Run the following command to create the virtual environment:
   
   ```bash
   conda env create -f temoa-stochastic.yml -n temoa-stochastic
   ```

4. Activate the newly created environment:

   ```bash
   conda activate temoa-stochastic
   ```

### Step 2: Install Editable Packages
Navigate to the following folders and run the installation command. Replace `<pyomo-main>`, `<pysp-main>` and `<mpi-sppy-main>` with the actual paths:

1. 
   ```bash
   cd <pyomo-main>
   pip install -e .
   ```

2. 
   ```bash
   cd <pysp-main>
   pip install -e .
   ```

3. 
   ```bash
   cd <mpi-sppy-main>
   pip install -e .
   ```

### Step 3: Replace Model Files
1. Navigate to the `temoa_model` folder within your project directory.
2. Replace the following files with the updated versions:
   - `temoa_run.py`
   - `temoa_stochastic.py`

### Step 4: Update Configuration File
1. Navigate to the `temoa_model` folder within your project directory.
2. Open the `config_sample` file in your preferred text editor.
3. Add or modify the following entries:

   ```yaml
   --input = <path/ScenarioStructure.dat>
   --output = <path/database.sqlite>
   #--saveDUALS
   ```

   - Replace `<path/ScenarioStructure.dat>` with the actual path to your `ScenarioStructure.dat` file.
   - Replace `<path/database.sqlite>` with the desired path and filename for storing output data.
   - Ensure the `saveDUALS` option is commented out as shown.

### Step 5: Run Your Model
Once all the steps are completed, you can proceed to run your stochastic optimization model using TEMOA. Make sure all paths and configurations are correctly set.

Run the model using the following command:

```bash
python temoa_model/temoa_stochastic.py --config=temoa_model/config_sample
```
___
For further assistance, refer to the official [TEMOA documentation](https://temoacloud.com/temoaproject/) or write to [matteo.nicoli@polito.it](mailto:matteo.nicoli@polito.it).