% Spencer Iannantuono
% 11/13/23
% ECE 202 Excersize M8
% Finding coeficients for use in partial fraction expansion

clear


% Coefficient matrix and constants vector
A = [1 1 1; -5 -4 -3; 6 3 2];
b = [6; 5; 4];
% solve for c's
c = A\b

loop = true;

while true

    % Input number of intervals
    n = input("Enter number of intervals: ");
    
    % Range of x
    x = linspace(-4, 4, n);
    
    % Calculate the function
    Nx = b(1)*x.^2 + b(2)*x + b(3);
    Dx = (x-1) .* (x-2) .* (x-3);
    Rx = Nx ./ Dx;
    R1x = c(1) ./ (x-1);
    R2x = c(2) ./ (x-2); 
    R3x = c(3) ./ (x-3);
    % Check if Rx = sum(R1,2,3), should be 0
    checkSum = Rx - (R1x + R2x + R3x);
    
    % Sum of abs vals of difference
    sumCheck = sum(abs(checkSum));
    fprintf('Sum of the absolute differences: %f\n', sumCheck);

    % Ask to continue
    cont = input('Another try? (Y/N) ', 's');
    if cont == 'Y' 
        continue
    else
        break
    end

end

% Analysis/Explanation

% After reviewing my input values, it looks like certain values create
% breaks in the function. This can happen for a number of reasons, but
% most important are when we try to divide by 0 or when there just aren't
% enough intervals to accurately plot the function. When we end up 
% dividing by zero, it creates an undefined function that creates the
% vertical breaks in the plot. When we have too small an amount of 
% intervals, this will create an unfinished plot that breaks before
% it is fully plotted.

