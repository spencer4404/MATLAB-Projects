% Spencer Iannantuono
% 9/20/23
% ECE 202 Lecture 7

% ------ Arrays for t and v

t = linspace(0,200,401); % Start, number of things, end - time array, in seconds, 5*tau = 200
v = 12*(1-exp(-t/40)); % volrage, in V, A = 12, tau = 40

% ------ Make tables

n = 1:401; % array of indicies, 1-401

vtTable = [n; t; v].'

vtTable2 = table(n.',t.',v.','VariableNames', ...
    {'Index n','Time (s)','Voltage (V)'})

plot(t,v, 'k:', 'LineWidth', 3)
ax = gca; ax.FontSize = 12; % 12 point font size for axis values

xlabel("Time (s)")
ylabel("Voltage (V)")
title("ECE 202 Lecture 7: Voltage of a charging capacitor")    