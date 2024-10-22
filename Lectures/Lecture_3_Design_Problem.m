% Spencer Iannantuono
% ECE 202 Lecture 2: Intro to MatLab
% 9/11/23
% Design tire's friction coefficient to meet minimum 
% stopping distance requirement

clear % Clear all old variables

% ------- Given information -------- %

v0kph = 100; % initial velocity of the car (Km/h)
v0 = v0kph*1000/3600; % initial velocity of the car (m/s)
vf = 0; % final velocity (m/s)
g = 10; % Gravitational Approximate (N/kg)
dspec = 120; %  max stopping distance spec (m)

% ------- Calculations ------- %

us = v0^2/(2*g*dspec)

% ------- Check: use M1 equations to verify stopping distance ------- %

m = 100; % weight of the car (kg, arbitrary) 

Fmax = -us*m*g; % Largest net foce, in N, answer to (a)

amax = Fmax/m; % Largest acceleration, in m/s^2, answer to (b)

tmin = (vf-v0)/amax; % Stopping time (s)
dmin = v0*tmin + 1/2*amax*tmin^2; % Distance (m), answer to (c)

check_spec_met = dspec - dmin % Check spec is met, should be >= 0 (m)

% ------- Second Check -------- %

dEk = 0.5*m*vf^2 - 0.5*m*v0^2; % Kinetic energy differential

dEth = abs(Fmax)*dmin; % Thermal energy differential 

check_energy = dEk + dEth % Check energy preservation; should be zero