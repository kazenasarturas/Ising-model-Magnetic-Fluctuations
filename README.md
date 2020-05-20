# Ising-model-Magnetic-Fluctuations
A MATLAB process simulating the magnetic fluctuations vs time in a 2-D array with respect to a fixed temperature


## Requirements

* MATLAB
* Parallel computing toobox (for parallel implementation)

## MATLAB code

Download and save the following files in the same directory to run the model:
* initSpins.m
* metropolis.m
* energyIsing.m
* magnetisationIsing.m
* magVStime.m

Select a fixed temperature value (around the critical temperature 2.27) for T1 and T2 variables in updatePlot.m file.

Add the following file in the same directory to plot the magnetic fluctuations in the model:
* updatePlot.m

Run magVStime.m and allow some time for the process to finish running. After the process is finished running an animated gif of each plot will be created in your local directory to view the animated results of the simulation. An example of the expected results are shown below for:

* temperautre values below its critical temperature (1 and 2),
* at the critical temperature (2.27) and
* above the critical temperature (4).

![](magFluc_1_2.gif)

Average magnetisation strength to T = 1 is 0.9992 
Average magnetisation strength to T = 2 is 0.8977 


![](magFluc_2.27_4.gif)

Average magnetisation strength to T = 2.27 is 0.4501 
Average magnetisation strength to T = 4    is 0.0071 
