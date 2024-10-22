% Spencer Iannantuono
% 9/10/2023
% ECE 202 MATLAB exercise M1
% Find the final velocities of two carts that collide elastically, 
% then check the conservation of momentum and energy

clear 

% ----- Givens ----- % 

% Left cart is #1; right cart is #2

m1 = 250;  % mass, in g
m2 = 150;  % mass, in g
v1i = 30;   % initial velocity, in cm/s
v2i = -40;   % initial velocity, in cm/s

% ----- Calculations ----- %
% Citation: https://www.geeksforgeeks.org/elastic-collision-formula/# 

M = m1+m2; % Total mass of the carts, M (g)

v1f = 1/M*((m1-m2)*v1i + 2*m2*v2i)  % final velocity of cart 1, in cm/s
v2f = 1/M*((m2-m1)*v2i + 2*m1*v1i)   % final velocity of cart 2, in cm/s

% ----- check two conservation laws ----- %

% Conservation of Momentum, should be 0 

checkP = (m1*v1i + m2*v2i) - (m1*v1f + m2*v2f)
           
% Conservation of Energy, should be 0

checkE = .5*(m1*v1i^2 + m2*v2i^2 - m1*v1f^2 - m2*v2f^2) 