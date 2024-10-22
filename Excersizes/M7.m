% Spencer Iannantuono
% 11/13/23
% ECE 202 Excersize M7
% Plotting voltage, current, and power absorbed for a charging inductor
% all in one plot window

clear

% ----- Givens

v0 = 5; % voltage source (Volts)
L = 10; % inductance (mH)
R = 2; % resistance (Ohms)
T = L / R; % time constant tau
I_final = v0 / R; % Steady-state current (A)

% ----- Time setup

N = 400; % amount of intervals
t_end = 10 * T; % Ending time
t = linspace(0, t_end, 401); % time array

% ----- Calculations

it = I_final * (1 - exp(-t/T)); % current over time
vt = v0 * exp(-t/T); % voltage over time
pt = it .* vt; % power over time

% ----- Plot

figure('Position',[200,200,1000,750]);

% first subplot
subplot(3,1,1)
plot(t,it, 'r', 'LineWidth',3)
grid on;
ax = gca; ax.FontSize = 13;
ylabel('Current (A)', FontSize=15, FontWeight='bold')
ylim([0,3])

% add LaTeX text for fist subplot
text(28, 0.5, '$i(t) = 2.5 \cdot (1 - e^{-\frac{t}{5}})$',...
'Interpreter', 'latex', 'FontSize', 20)

% second subplot
subplot(3,1,2)
plot(t,vt, 'g', 'LineWidth',3)
grid on;
ax = gca; ax.FontSize = 13;
ylabel('Voltage (V)', FontSize=15, FontWeight='bold')
ylim([0,6])

% add LaTeX text for second subplot
text(41, .5, '$v(t) = 5 \cdot e^{-\frac{t}{5}}$',...
'Interpreter', 'latex', 'HorizontalAlignment', 'right',...
'VerticalAlignment', 'bottom', 'FontSize', 20)

% third subplot
subplot(3,1,3)
plot(t,pt, 'b', 'LineWidth',3)
grid on;
ax = gca; ax.FontSize = 13;
ylabel('Power (W)', FontSize=15, FontWeight='bold')
xlabel('Time (ms)', FontSize=15, FontWeight='bold')
ylim([0,3.5])

% add LaTeX text for third subplot
text(45, 0.1, '$p(t) = v(t) \cdot i(t)$',...
'Interpreter', 'latex', 'HorizontalAlignment', 'right',...
'VerticalAlignment', 'bottom', 'FontSize', 20)

% Super title
sgt = sgtitle({'ECE 202 Excersize M7: Current, Voltage, and Power', ...
['absorbed for a charging inductor ($V_0 = 5\mathrm{V}, R = ' ...
'2\Omega, L = 10\mathrm{mH}$)']}, 'Interpreter', 'latex');
sgt.FontSize = 20;

% ----- Compute energy differences

% Final energy in inductor
W_final = 0.5 * L * I_final^2;

% Total energy absorbed
W_absorbed = trapz(t, pt); % Using trapezoidal numerical integration

% percent error, should be 0
percent_error = 100 * (W_final - W_absorbed) / W_final

% Output Results
fprintf('Final Energy Stored in Inductor: %f mH\n', W_final);
fprintf('Total Energy Absorbed: %f mH\n', W_absorbed);
fprintf('Difference in energy: %f\n', W_final-W_absorbed)
fprintf('Percent Error: %f%%\n', percent_error); 

