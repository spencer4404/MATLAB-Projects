% Spencer Iannantuono
% ECE 202 Lecture 2: Intro to MatLab
% 9/07/23
% Find the shortest stopping distance for a car on a flat road

clear % Clear all old variables

% ------- Given information -------- %

m = 950; % mass of the car (kg)
v0 = 20; vf = 0; % Initial and final velocity (m/s)
uk = 0.1; us = 0.4; % Kinetic and static friction coefficients (N/N)
g = 10; % Gravitational Approximate (N/kg)

% ------- Calculations ------- %

Fmax = -us*m*g % Largest net foce, in N, answer to (a)

amax = Fmax/m % Largest acceleration, in m/s^2, answer to (b)

tmin = (vf-v0)/amax; % Stopping time (s)
dmin = v0*tmin + 1/2*amax*tmin^2 % Distance (m), answer to (c)

% ------- Answer Check -------- %

dEk = 0.5*m*vf^2 - 0.5*m*v0^2; % Kinetic energy differential

dEth = abs(Fmax)*dmin; % Thermal energy differential 

check_energy = dEk + dEth % Check energy preservation; should be zero