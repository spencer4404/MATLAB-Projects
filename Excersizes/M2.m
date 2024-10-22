% Spencer Iannantuono
% 9/13/2023
% ECE 202 MATLAB exercise M2

% https://www2.chem.wisc.edu/deptfiles/genchem/netorial/modules/thermodynamics/energy/energy2.htm#:~:text=Kinetic%20energy%20is%20directly%20proportional,meters%20squared%20per%20second%20squared.

% In this excersize, we are taking what we learned in M1 and turning it
% into a design problem and allowing the user to input what they want. The
% goal is to calculate the mass of cart 2 that will make it stop on impact
% based on the given cart 1 mass and initial velocity


clear   % clears the registers, which helps catch typos


% ----- givens -----

% Left cart is #1; right cart is #2

m1 = input("Mass of cart 1 (g): "); % Initial mass of cart 1, g
v1i = input("Initial velocity of cart 1 (cm/s): "); 
% Initial velocity of cart 1, cm/s
v2i = -v1i; % Initial velocity of cart 2, cm/s
v2f = 0; % Final velocity of cart 2, cm/s


% ----- calculation -----

m2 = m1*(2*v1i - v2i - v2f)/(v2f-v2i)
% Mass of cart 2 that allows it to stop on impact, g


M = m1+m2; % Total mass of the carts, g

v1f = 1/M*((m1-m2)*v1i + 2*m2*v2i) % Final velocity of cart 1, cm/s

        % *** expressions for v1f (below) and v2f are from M1 ***


% ----- check conservation of momentum and energy -----

checkP = (m1*v1i + m2*v2i) - (m1*v1f + m2*v2f)   
% Conservation of momentum, should be 0 


% initial and final kinetic energies, in J

KEi = .5*(m1*v1i^2 + m2*v2i^2); % Initial KE, J
KEf = .5*(m1*v1f^2 + m2*v2f^2); % Final KE, J

checkKE = KEf - KEi  
% Conservation of energy, should be 0


% ----- check that design is successful -----

check_v2f = 1/M*((m2-m1)*v2i + 2*m1*v1i)   % Final velocity of cart 2, 
% should be 0


% This design seems to be succesful, as all values come out as expected.
% The initial and final kinetic energies are the same, and the difference
% is zero, as expected. Conservation of momentum is zero, as expeceted. The
% ratios also seem correct just by looking at them - the mass of cart 2 is
% 3x the mass of cart 1, and all the velocity from cart 2 is transferred,
% which is to be expected with a frictionless experiment.