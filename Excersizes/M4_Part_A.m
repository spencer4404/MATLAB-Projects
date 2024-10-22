% Spencer Iannantuono
% 9/23/23
% ECE 202 Excersize M4, Part (A)

% Truncated Power Series

% clear unwanted variables

clear 

% ------ Arrays for t and f

t = linspace(0,5,401); % time (s), 400 intervals
f = 1 + t./2 - t.^2/3; % y-axis equation

% ------ Plot the function

plot(t,f,'LineWidth', 3) % Create the plot
title("M4: Truncated Power Series") % Title the plot
xlabel("Time (s)") % label the x-axis