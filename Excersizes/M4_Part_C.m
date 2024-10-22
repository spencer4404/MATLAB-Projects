% Spencer Iannantuono
% 9/23/23
% ECE 202 Excersize M4, Part (C)

% Normalized Gaussian

% clear unwanted variables

clear 

% ------ Arrays for x and p

x = linspace(0,8,401); % x-axis variable (m); 400 intervals
p = 1/(2*sqrt(pi)) * exp(-(x-4).^2/4); % y-axis equation (m^-1)

% ------ Create the new window

figure('Position', [540,150,1000,800]) % Create, size, position window

% ------ Plot the function, size everything

plot(x,p,':', 'LineWidth', 3) % Plot the function in the window
ax = gca; ax.FontSize = 15; % Select and size axis labels
title("M4: Normalized Gaussian", "FontSize", 24) % Create and size title
xlabel("Distance (m)", "FontSize", 21) % Label and size x-axis
ylabel("Distance (m^{-1})", 'FontSize', 21) % Label and size y-axis

% ------ Integral

dx = (8)/401; % Each time interval (s)
pAbs = dx*sum(p) % Total probability, should be approx. 1