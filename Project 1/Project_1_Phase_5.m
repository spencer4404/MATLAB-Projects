% Spencer Iannantuono
% 11/9/2023
% ECE 202 Project 1: Power Series Expansion of Acos(wt)

% In this project, we show how 7cos(20t) can be expanded as 
% a truncated power series using the Taylor Series expansion.

% PHASE 6

clear

% ------ Create static variables, allow input

A = 7; % Amplitude
w = 20; % Frequency (Hz)
terms = input('How many terms? '); % Number of non-zero terms
points = input('How many intervals? '); % Amt of plotted points
t_min = input('Start time (ms) '); % Start time (ms)
t_max = input('End time (ms) '); % End time (ms)

% ------ Create dynamic variables

% Create n values for non-zero coefficients
n = 0:2:(terms-1)*2;

% Calculate coefficients
a_n = ((-1).^(n/2) * A .* w.^n) ./ factorial(n); 

% Create and display the table
coeff_table = table(n', a_n', 'VariableNames', {'n', 'Coefficients'});
disp(coeff_table)

% Time vectors
tms = linspace(t_min,t_max,points);  
ts = tms/1000;

% ------ Creating Functions and Plotting

figure('Position', [200,200,1400,750])

% Initialize p as a column vector
p = gobjects(terms, 1); 

hold on;

% Horizontal axis line
p(1) = plot([t_min, t_max], [0,0], 'k', 'LineWidth', 1);

% Create functions dynamically

f = zeros(1, length(ts)); % initialize vector of zeros
for k = 1:terms % initialize for loop to go to number of terms
    f = f + a_n(k) * ts.^(n(k));
    LW = 2; % Origincal Linewidth
    if k == terms
        LW = 4; % Thicker last line
    end
    p(k + 1) = plot(tms, f, 'LineWidth', LW); % Plot functions
end

% ------ Check numerical difference when terms = 6, should be 0

if terms == 6
    % Old functions
    f1 = a_n(1) * ones(size(ts));
    f2 = f1 + a_n(2) * ts.^2;
    f3 = f2 + a_n(3) * ts.^4;
    f4 = f3 + a_n(4) * ts.^6;
    f5 = f4 + a_n(5) * ts.^8;
    f6 = f5 + a_n(6) * ts.^10;
    difference = norm(f6 - f); % Take magnitude of the difference
    fprintf("Difference between two methods: %g\n",difference) 
end

% ------ Average Deviation

exact_f = A*cos(w*ts);
calc_f = f;

deviations = abs(exact_f - calc_f);
avg_deviation = mean(deviations);

fprintf("Average deviation: %g",avg_deviation)

% ------ Setting titles and axis labels

ax = gca; ax.GridAlpha = .4; ax.FontSize = 16;

% Create the title string
title_str = sprintf(['Taylor Series Approximations of %dcos(%dt) - ' ...
    'Approximated to %d Terms\nAvg. Deviation: %g'], ...
A, w, terms, avg_deviation);
% Create the title, sized appropriately
title('ECE 202 Project 1 Phase 5', ...
    [title_str], FontSize=24);

xlabel('Time (ms)', FontSize=20);
ylabel('Function Value', FontSize=20);
grid on;
ylim([-A*5 A*5]);

% ------ Legend

legendLabels = {'y = 0'};
% Dynamically create the legend labels
for k = 1:terms
    legendLabels{end + 1} = ['n = ' num2str(n(k))];
end
legend(p, legendLabels, 'Location', 'northeastoutside', 'FontSize', 18);

% ===== QUESTION ANSWERS ===== %
% A) The least number of non-zero terms I found 
% to create the original function was 14.

% B) The average deviation in part (a) was 0.0074. 
% After doubling the intervals, the deviation was still 0.0073.
% This is a slight difference, but that makes sense 
% as the more intervals we plot, the more accurate the function will be.

% C) My prediction is that the deviation will be higher, 
% as we are calculating the same amount of terms but they will be 
% spread over double the amount of time. 

% D) My prediction was technically correct, 
% as the deviation is higher but only by a small margin 
% of 0.0002 (new deviation: 0.0076). This makes sense because 
% the terms used are also calculated on the negative side of the 
% y-axis even if we are not looking at that time period, and I did 
% not think about that.
% I think the deviation will be the same, as the function will still be plotted across 500ms, as it was in the previous phases.
% As the function progresses past 500ms, the main function that we are building just drops off, as if it is just another term. This makes sense as we do not have enough values to calculate the function through the whole time period. We chose t = 0 because everything starts at 0 time, as we can never really have negative time. The farther we get from t, the more terms we need to build a complete function. 
% 28 terms seems to complete the function while also bringing the avg deviation down significantly. This makes sense as we doubled the time, so we should also double the terms.








