% Spencer Iannantuono
% 11/10/23
% ECE 202 Project 2

% Calculating force and distance
% on a baseball after it was hit 

% PHASE 2

clear

% ----- Givens

R0 = 463; % range of HR, in feet
v0mph = 116; % exit velocity, in mph 
phi0deg = 28; % launch angle, in degrees
mass_baseball = 0.145; % mass of the baseball in kg

x0 = 0; y0 = 0;
g = 9.8; % gravity force, in m/s^2
Fg = mass_baseball * g; % Force of gravity on baseball

% time is in s, distance in m, speed in m/s, etc.

% --- conversion factors

mph2mps = 5280 * 12 * 2.54 / 100 / 3600; % mph to m/s conversion
deg2rad = pi/180; % degrees to radians
m2ft = 1*3.28; % meters to feet conversion

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

% --- Numerical solution

% Drag coefficient
C = input('Enter drag coefficient: ');

% Constants
p_air = 1.293; % air density (kg/m^3)
A = pi * 0.0375^2; % area of cross section (m^2), radius of 0.0375m

dt = (tmax - tmin) / N;

yn = zeros(1, N + 1); % position y as a function of time
xn = zeros(1, N + 1); % position x as a function of time

yn(1) = y0; % initial position y
xn(1) = x0; % initial position x

vy = v0y; % initial velocity y component
vx = v0x; % initial velocity x component

for n = 1:N

    % speed of baseball
    v = sqrt(vx^2 + vy^2);

    % Drag components
    Fdrag_x = -0.5 * C * A * p_air * v * vx;
    Fdrag_y = -0.5 * C * A * p_air * v * vy;
    
    % New acceleration components
    ay = (Fdrag_y - Fg) / mass_baseball; % y acceleration, with drag
    ax = Fdrag_x / mass_baseball;  % x acceleration, with drag

    % Update position and velocity
    yn(n+1) = yn(n) + dt * vy + 0.5 * dt^2 * ay;
    xn(n+1) = xn(n) + dt * vx + 0.5 * dt^2 * ax;

    vy = vy + ay * dt;
    vx = vx + ax * dt;
    
end

% convert to feet for plotting
xn_ft = xn * m2ft;
yn_ft = yn * m2ft; 

% Check if C is zero

if C == 0
    % comparison checks, should be 0
    check_num_y = sum(abs(yn_ft - ya * m2ft)); 
    check_num_x = sum(abs(xn_ft - xa * m2ft)); 
    fprintf('Numeric vs Analytic Comparison Check for x: %d\n', ...
        check_num_x);
    fprintf('Numeric vs Analytic Comparison Check for y: %d\n', ...
        check_num_y);
end

% ----- Plotting
figure('Position', [200,200,1400,750])
plot(xa * m2ft, ya * m2ft, xn_ft, yn_ft, '--', 'LineWidth', 5)
ax = gca; ax.FontSize = 14;
grid on;
grid minor;
ax.GridAlpha = 0.4; ax.MinorGridAlpha = 0.5;
xlabel('Horizontal Distance (ft)', 'FontSize', 20);
ylabel('Vertical Distance (ft)', 'FontSize', 20);
title('ECE 202 Project 2 Phase 2', ['Trajectory of a Baseball With ' ...
    'and Without Drag'], 'FontSize', 24);
legend('No drag', sprintf('Drag C = %f',C), 'FontSize', 18);

% ----- Exporting to excel

% Create data matrix
dataMatrix = [t' xn_ft' yn_ft']; % Each column represents t, xn_ft, and yn_ft

% Define file name
filename = 'baseball_trajectory.csv';

% Export data matrix to CSV file
writematrix(dataMatrix, filename);