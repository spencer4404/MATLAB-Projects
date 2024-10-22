% Spencer Iannantuono
% 9/23/23
% ECE 202 Excersize M4, Part (B)

% Shifted sinusoid

% clear unwanted variables

clear 

% ------ Arrays for x and g

x = linspace(-6,6,401); % x-axis variable (m), 400 intervals
g = 5*sin(2*(x-3)); % y-axis equation

% ------ Plot the function

plot(x,g, 'r') % Create the plot
axis([-2*pi 2*pi -6 6]) % Set the bounds
title("M4: Shifted Sinusoid") % Create the title
xlabel("Distance (m)") % Label the x-axis