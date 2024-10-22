% Spencer Iannantuono
% Plots, numerical integrals

clear
clf % Clear/create clear figure window

tmin = -10;
tmax = 10;
N = 1000

t = linspace(tmin,tmax,N+1); % time vector, in seconds

% x(1) = 10t cos(4t)
x = 10*t.*cos(4*t); % Samples of x(t)
plot(t,x)

figure % open new figure window

% x(t) = 10e^(-t/4)cos(5t): damped sinusoid
x2 = 10*exp(-t/4) .* cos(5*t); % samples of x(t)

x3 = cos(5*t);

plot(t,x2)

% Compute spacing
dt = (tmax-tmin)/N;
x2int = dt*sum(x3(1:N))