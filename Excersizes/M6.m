% Spencer Iannantuono
% 11/6/23
% ECE 202 Excersize M6

% In this excersize, we take what we have done in M3 and make it more robust and allow user input. Once this is done, we can solve for any combination of masses and velocities.

clear


% ----- Getting Started -----

% mass of carts, (left to right, g)
global m
m = input('Enter three masses inside []: '); 

% initial velocities of carts (left to right, cm/s)
v = input('Enter three initial velocities inside []: '); 

% set up total masses for two types of collisions

m23 = m(2) + m(3); % Combined mass of cart 2 & 3
m12 = m(1) + m(2); % Combined mass of cart 1 & 2

% set up the checks by computing initial total energy and momentum

KE0 = sum(.5.*m.*v.^2);
% Initial kinetic energy of system (J)

P0 = sum(m.*v);
% Initial momentum of system (Ns)

% ----- Collision loop

% Count collisions
collisions = 0;
% Get threshold
threshold = input('Enter threshold for conservation checks: ');

while v(1) > v(2) || v(2) > v(3)
    collisions = collisions + 1;
    if v(1) > v(2)
        next = 12;
    end
    
    if v(2) > v(3)
        next = 23;
    end
    
    if v(1) > v(2) && v(2) > v(3)
        next = input("Which carts collide? '12' or '23'? ");
    end 
    % compute new velocities
    v = Collision(v, next)
    
    % Show collision count
    fprintf('Collisions: %g\n',collisions)
    
    % Check conservation of energy
    KEf = sum(.5.*m.*v.^2);
    Pf = sum(m.*v);
   
    % Should be 0
    check_KE = KEf - KE0;
    check_P = Pf - P0;
    
    if check_KE > threshold
        fprintf('There was a problem. Check_KE = %g\n',check_KE)
    end
    if check_P > threshold
        fprintf('There was a problem. Check_P = %g\n',check_P)
    end
end

% ----- Check if no more collisions

if collisions == 0
    disp('There were no collisions')
else
    disp('There are no more collisions')
end
 

% ----- User-defined function

function vf = Collision(v,next)
    global m
    if next == 12
        M = m(1) + m(2);
        vf(1) = (1/M)*((m(1) - m(2))*v(1) + 2*m(2)*v(2));
        vf(2) = (1/M)*(2*m(1)*v(1) + (m(2) - m(1))*v(2));
        vf(3) = v(3);

    elseif next == 23
        M = m(2) + m(3);
        vf(1) = v(1);
        vf(2) = (1/M)*((m(2) - m(3))*v(2) + 2*m(3)*v(3));
        vf(3) = (1/M)*(2*m(2)*v(2) + (m(3) - m(2))*v(3));
        
    end

end