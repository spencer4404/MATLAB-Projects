% Spencer Iannantuono
% 10/24/2023
% ECE 202 Project 1: Power Series Expansion of Acos(wt)

% PHASE 4

clear

% ------ Define variables and functions

A = 7; % Amplitude
w = 20; % Frequency (Hz)
terms = 6; % Number of non-zero terms
t_lim = 500; % Time limit (ms)
points = 400; % Amt of plotted points

% ------ Implement new variables

% Create n values for non-zero coefficients
n = 0:2:10;

% Calculate coefficients
a_n = ((-1).^(n/2) * A .* w.^n) ./ factorial(n); 

% Create and display the table
coeff_table = table(n', a_n', 'VariableNames', {'n', 'Coefficients'});
disp(coeff_table)

% ------ Create and plot functions, implement new variables

% Time vectors
tms = linspace(0,t_lim,points);  
ts = tms/1000;

% ------ Define functions dynamically, plot

figure('Position', [200,200,1400,750])

%Initialize p as a column vector
p = gobjects(terms, 1); 

hold on;

p(1) = plot([0, t_lim], [0,0], 'k', 'LineWidth', 1); % Horizontal axis line

f = zeros(1, length(ts)); % initialize vector of zeros
for k = 1:terms % initialize for loop to go to number of terms
    f = f + a_n(k) * ts.^(n(k));
    LW = 2;
    if k == terms
        LW = 4;
    end
    p(k + 1) = plot(tms, f, 'LineWidth', LW);
end

% Define legend labels

legendLabels = {'y = 0', 'n = 0', 'n = 2', 'n = 4', 'n = 6', 'n = 8', ...
    'n = 10'};

% Old functions
f1 = a_n(1) * ones(size(ts));
f2 = f1 + a_n(2) * ts.^2;
f3 = f2 + a_n(3) * ts.^4;
f4 = f3 + a_n(4) * ts.^6;
f5 = f4 + a_n(5) * ts.^8;
f6 = f5 + a_n(6) * ts.^10;

% ------ Check numerical difference 

difference = norm(f6 - f); % Take magnitude of the difference
fprintf("Difference between two methods: %g",difference) 
% Check difference, should be 0

% ------ Setting titles, labels, legend

ax = gca; ax.GridAlpha = .4; ax.FontSize = 16;
title_str = sprintf(['Taylor Series Approximations of %dcos(%dt) - ' ...
    'Approximated to %d Terms'], A, w, terms);
title('ECE 202 Project 1 Phase 4', ...
    [title_str], FontSize=24);
xlabel('Time (ms)', FontSize=20);
ylabel('Function Value', FontSize=20);
grid on;
ylim([-A*5 A*5]);
legend(p, legendLabels, 'Location', 'northeastoutside', 'FontSize', 18);
