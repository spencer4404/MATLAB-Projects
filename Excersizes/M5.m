% Spencer Iannantuono
% 10/2/2023
% ECE 202 Excersize M5
% Demonstrating that the product of two sinusoids can be written
% as the sum of two sinusoids

clear

% ------ Citation, Formula

% http://hyperphysics.phy-astr.gsu.edu/hbase/trid.html
% cos(a)*cos(b) = .5*(cos(a+b) + cos(a-b))

% ------ Givens

tms = linspace(-100,100,401);% Time (ms), 400 intervals
ts = tms/1000; % Time (s)
a = 40*ts - 1.2; % First inner function
b = 60*ts + 1.8; % Second inner function
k = 10; % Scalar
s1 = (k/2)*cos(a+b); % first sinusoid
s2 = (k/2)*cos(a-b); % Second sinusoid
ft = k*cos(a) .* cos(b); % product of two sinusoids

% ------ Checking function and value

fcheck = ft - s1 - s2; % Check if the functions are equal, should be 0
check_value = sum(abs(fcheck)) 
% Numerical check for the functions, should be 0

% ------ Creating the canvas

figure('Position', [150,150,1700,800]);

% ------ Plotting the sinusoids

plot(tms,ft,'r', tms,s1,'g', tms,s2,'b', tms,fcheck,'black', LineWidth=1.5)
ax = gca; ax.FontSize = 15;
title('Product and Sum of Two Sinusoids',... 
    'Proving that cos(a)*cos(b) can be written as .5*(cos(a+b) + cos(a-b))',...
    FontSize = 24)
legend("f = product of sinusoids", "s1 = First sinusoid",...
    's2 = Second Sinusoid', 'f1-s1-s2, should be 0',...
    FontSize = 15)
ylim([-20 20])
xlim([-105 105])
xlabel("Time (ms)", FontSize = 20)
ylabel("Amplitude", FontSize = 20)