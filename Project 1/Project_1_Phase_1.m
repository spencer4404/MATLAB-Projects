% Spencer Iannantuono
% 10/24/2023
% ECE 202 Project 1: Power Series Expansion of Acos(wt)

clear

% ----------- 

% Create n values for non-zero coefficients
n = 0:2:10;

% Calculate coefficients
a_n = ((-1).^(n/2) * 7 .* 20.^n) ./ factorial(n);

% display outputs in command window
format shortG
disp('Coefficients: (a_n):' )
disp(a_n)

% ------ Create and plot functions

% Time vector
t = linspace(0,0.5,400);

% Define functions
f1 = a_n(1) * ones(size(t));
f2 = f1 + a_n(2) * t.^2;
f3 = f2 + a_n(3) * t.^4;
f4 = f3 + a_n(4) * t.^6;
f5 = f4 + a_n(5) * t.^8;
f6 = f5 + a_n(6) * t.^10;

% Plot 
figure;
plot(t, f1, t, f2, t, f3, t, f4, t, f5, t, f6);

ax = gca;
title('ECE 202 Project 1 Phase 1',...
    ['Taylor Series Approximations of 7cos(20t) - ' ...
    'Approximated to 6 Terms']);
xlabel('Time (s)');
ylabel('f(t)');
grid on;
ylim([-10 10]);
legend('f1','f2','f3','f4','f5','f6');





