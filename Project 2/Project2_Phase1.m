% Spencer Iannantuono
% 11/10/23
% ECE 202 Project 2

% Calculating force and distance
% on a baseball after it was hit 

% PHASE 1

clear

% ----- Givens

R0 = 463; % range of HR, in feet
v0mph = 116; % exit velocity, in mph 
phi0deg = 28; % launch angle, in degrees
mass_baseball = 0.145; % mass of the baseball in kg

x0 = 0; y0 = 0;
g = 9.8; % gravity force, in m/s^2

% time is in s, distance in m, speed in m/s, etc.

% --- conversion factors

mph2mps = 5280 * 12 * 2.54 / 100 / 3600; % mph to m/s conversion
deg2rad = pi/180; % degrees to radians
m2ft = 1/0.3048; % meters to feet conversion

v0 = v0mph * mph2mps; % initial speed
phi0 = phi0deg * deg2rad; % launch angle, radians

v0x = v0 * cos(phi0); % x-component of velocity
v0y = v0 * sin(phi0); % y-component

% --- compute some useful quantities for the trajectory

tH = v0y / g; % time to reach maxmium height
tLand = 2 * tH; % time to land (time of flight)

H = tH * v0y / 2; % max height
R = v0x * tLand; % range

R_ft = R * m2ft; % conversion, range in ft

% --- compute analytical solution

tmin = 0; tmax = tLand;
N = 400; % intervals

t = linspace(tmin, tmax, N + 1); % time array, create x(t) y(t)

xa = x0 + v0x * t; % analytical x(t), no drag

ya = y0 + v0y * t - (1/2) * g * t.^2; % analytical y(t), no drag

% --- add numerical solution

dt = (tmax - tmin) / N;

yn = zeros(1, N + 1); % position y as a function of time
xn = zeros(1, N + 1); % position x as a function of time

yn(1) = y0; % initial position y
xn(1) = x0; % initial position x

vy = v0y; % initial velocity y component
vx = v0x; % initial velocity x component

for n = 1:N

    ay = -g; % acceleration y due to gravity
    ax = 0;  % no drag
    yn(n+1) = yn(n) + dt * vy + (1/2) * (dt^2) * ay; 
    xn(n+1) = xn(n) + dt * vx + (1/2) * (dt^2) * ax; 

    vy = vy + ay * dt; % new vertical velocity
    vx = vx + ax * dt; % new horizontal velocity
    
end

% convert to feet for plotting
xn_ft = xn * m2ft;
yn_ft = yn * m2ft;

% comparison checks, should be 0
check_num_y = sum(abs(yn_ft - ya * m2ft)); 
check_num_x = sum(abs(xn_ft - xa * m2ft)); 

% plotting
figure('Position', [200,200,1400,750])
ax = gca; ax.FontSize = 14;
plot(xa * m2ft, ya * m2ft, xn_ft, yn_ft, '--', 'LineWidth', 5)
grid on

xlabel('Horizontal Distance (ft)', 'FontSize', 18)
ylabel('Vertical Distance (ft)', 'FontSize', 18)
title('ECE 202 Project 2 Phase 1', ['Analytical vs. Numerical ' ...
    'Trajectory of a Baseball'], 'FontSize', 22)
legend('Analytical', 'Numerical', 'FontSize', 18)

% Output comparison checks, should be 0
fprintf('Numeric vs Analytic Comparison Check for x: %d\n', check_num_x);
fprintf('Numeric vs Analytic Comparison Check for y: %d\n', check_num_y);