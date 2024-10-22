% Spencer Iannantuono
% 9/23/23
% ECE 202 Excersize M4, Part (D)

% Three dampings for parallel RLC

clear

% ------ Arrays for t and v

tms = linspace(0,50,401); % Time (ms); 400 intervals
ts = linspace(0,.5,401); % Time (s) for voltage; 400 intervals
v1 = 10*exp(-500*ts) - 5*exp(-300*ts); % Overdamped voltage (V)
v2 = 10*exp(-400*ts) - 5000*ts .* exp(-400*ts); 
% Critically damped voltage (V)
v3 = 10*exp(-150*ts) - cos(450*ts) + 4*exp(-150*ts) .* sin(450*ts);
% Underdamped voltage (V)

% ------ Create the new window

figure('Position', [200,150,1500,800]) % Create, size, position window

% ------ Plot the function, size everything

plot(tms,v1,'r', tms,v2,'g', tms,v3,'b', LineWidth=1.2) 
% Plot the function in the window
ax = gca; ax.FontSize = 15; % Select and size axis labels
title("M4: Three Dampings for Parallel RLC", "FontSize", 24)
% Create and size title

xlabel("Time (ms) ", "FontSize", 21) % Label and size x-axis
ylabel("Voltage (V)", 'FontSize', 21) % Label and size y-axis
legend('Overdamped', 'Critically damped', 'Underdamped')
% Create the legend
