% Spencer Iannantuono
% September 15, 2023
% ECE 202 Lecture 5
% Find the area under the curve y = x^n

% if logical_expression ==, ~= (!=), >, <, >=, <=, && (and), || (or)
    % executed of logical_expression is true
% else, elseif, end

clear

% ------- givens ------- %
repeat = 1;
while repeat ==1

    n = input("Enter the exponent n in x^n: ");
    a = input("Enter the lower limit a: ");
    b = input("Enter the upper limit b: ");
    
    if n < 0 && (a == 0 || b == 0 || a/b < 0)
    
        disp("Error: cannot compute area under the curve with these limits.")
        
    elseif n == -1
        
        A = log(b/a) % Natural log; log10 is base 10 log
        
    else
        np1 = n+1;
        A = (b^np1 - a^np1)/np1
        
    end
    
    disp("Thanks!")
    repeat = input("To repeat, press 1 ")
end