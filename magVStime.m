% Author: Arturas Kazenas

% magVStime.m simulates magnetic fluctuations for different temperature
% values (variables T1, T2). The process plots two results at a time to
% compare differences in magnetic fluctuations due to temperature.
clc
clear all

numSpinsPerDim = 10;                 % Size of array (specified by one dimention)
probSpinUp = 0.5;                    % Probability of spin orientation changing
J = 1;                               % Exchange constant

% Temperatures to sample
numTemps = 2^9;                      % Number of Ising model sweeps
T1 = 1;                            % Temperature value for plot 1
T2 = 2;                            % Temperature value for plot 2

tic % Start process timer

for tempIndex = 1 : numTemps
    spin = initSpins(numSpinsPerDim, probSpinUp);       % Initialising spins of array
    spin1 = metropolis(spin, T1, J);                    % Flipping spins using metropolis algorithm for T1
    spin2 = metropolis(spin, T2, J);                    % Flipping spins using metropolis algorithm for T2
    Emean1(tempIndex) = energyIsing(spin, J);           % Calculating average energy level of array
    Mmean1(tempIndex) = magnetizationIsing(spin1);      % Calculating average magnetic potention of array fo T1
    Mmean2(tempIndex) = magnetizationIsing(spin2);      % Calculating average magnetic potention of array fo T2
    
    timeElapsed(tempIndex) = toc;                       % Stop process timer
    
    % Plotting magnetic fluctuations with respect to time
    updatePlot(Mmean1, Mmean2, T1, T2, tempIndex, numSpinsPerDim, numTemps, timeElapsed);
    drawnow;
end

MAG1 = mean(Mmean1)     % Average magnetisation levels for T1
MAG2 = mean(Mmean2)     % Average magnetisation levels for T2


