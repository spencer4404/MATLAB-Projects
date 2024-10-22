% Spencer Iannantuono
% 9/18/2023
% Lecture 6: Output a complex number in apporpriate formatting

a = input("Enter value of a in a+jb: ");
b = input("Enter value of b in a+jb: ");

if b >= 0
    bSgn = '+';
else
    bSgn = "-";
end
    
fprintf("\nz = %g %s j%g\n",a, bSgn, abs(b))