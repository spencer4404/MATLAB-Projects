%{
Spencer Iannantuono
9/25/2023
ECE 202 Lecuture 9
Intro to Project 1: Getting started with Taylor Series

Example: Test that f(t) = e^-t = 1-t + (1/2)t^2 - .....

NOTES:

Use this to:

* Have a multiline title
* how to reposisition a legend
* plotting partial sums of a Taylor series expansion

%}

clear
clf

t = linspace(0, 4, 401);

f = exp(-t);

f1 = 1*(t.^0); % first order of approximation f(t)
f2 = 1-t;
f3 = 1 - t + (1/2)*t.^2; 

plot(t,f1,':', t,f2,':', t,f3,':', t,f,':', LineWidth = 3)

set(gca, FontSize = 16)

legend('First order', 'Second order', 'Third order', 'Target',...
    Location = 'Northwest')
title({'ECE 201 Project 1: Plotting multiple order approximations'...
    'of target function f(t) = e^{-t}'}, FontSize = 20)
xlabel('Time t (s)', 'Fontsize', 16)
ylabel('f(t)', 'Fontsize', 16)