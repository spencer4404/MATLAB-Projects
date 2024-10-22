% Spencer Iannantuono
% 9/20/23
% ECE 202 Excersize M3

% Citation:
% https://study.com/learn/lesson/law-of-conservation-of-momentum.
% html#:~:text=What%20is%20the%20formula%20for,
% in%20the%20system%20is%20constant.

% In this excersize, we are computing speeds of three carts after they have 
% collided and using if statements to decide if there are any 
% more collisions. We repeat this until there are no more collisions

clear

% ----- Getting Started -----

% givens

m = [300, 60, 240]; % mass of carts, (left to right, g)

v0 = [36, 9, -45]; % initial velocities of carts (left to right, g)

% set up total masses for two types of collisions

m23 = m(2) + m(3); % Combined mass of cart 2 & 3
m12 = m(1) + m(2); % Combined mass of cart 1 & 2

% set up the checks by computing initial total energy and momentum

KE0 = sum(.5.*m.*v0.^2);
% Initial kinetic energy of system (J)

P0 = sum(m.*v0);
% Initial momentum of system (Ns)


% ----- Collision #1 (A) -----

% The first collision will be between cart 2 and 3

vA = [ 0 0 0 ]; % initialize vA

vA(1) = v0(1); % New velocity of cart 1, same as v0(1) (cm/s)
vA(2) = (1/m23)*((m(2) - m(3))*v0(2) + 2*m(3)*v0(3)); 
% New velocity of cart 2 (cm/s)

vA(3) = (1/m23)*(2*m(2)*v0(2) + (m(3) - m(2))*v0(3)) 
% New velocity of cart 3 (cm/s)

% check energy and momentum, should be 0

checkKE_A = sum(.5.*m.*vA.^2) - KE0
% Final KE of system after collision A - initial KE (J)

checkP_A = sum(m.*vA) - P0 
% Final momentum of system after collision A - initial momentum (Ns)

% check to see if there is another collision and output result

if vA(1) > vA(2) || vA(2) > vA(3)
    disp("There is another collision")
else
    disp("There are no more collisions")
end


% ----- Collision #2 (B) -----

% The next collision will be between carts 1 and 2

vB = [ 0 0 0 ]; % Initialize vB

vB(1) = (1/m12)*((m(1) - m(2))*vA(1) + 2*m(2)*vA(2));
% New velocity of cart 1 (cm/s)

vB(2) = (1/m12)*(2*m(1)*vA(1) + (m(2) - m(1))*vA(2));
% New velocity of cart 2 (cm/s)

vB(3) = vA(3) % New velocity of cart 3, same as vA(3) (cm/s)

% Check energy and momentum, should be 0

checkKE_B = sum(.5.*m.*vB.^2) - KE0
% Final KE of system after collision B - initial KE (J)

checkP_B = sum(m.*vB) - P0 
% Final momentum of system after collision B - initial momentum (Ns)

% Check for more collisions

if vB(1) > vB(2) || vB(2) > vB(3)
    disp("There is another collision")
else
    disp("There are no more collisions")
end


% ------ Collision #3 (C) ------

% The next collision will be between carts 2 and 3

vC = [ 0 0 0 ]; % Initialize vC

vC(1) = vB(1); % New velocity of cart 1, same as vB(1) (cm/s)
vC(2) = (1/m23)*((m(2) - m(3))*vB(2) + 2*m(3)*vB(3));
% New velocity of cart 2 (cm/s)

vC(3) = (1/m23)*(2*m(2)*vB(2) + (m(3) - m(2))*vB(3))
% New velocity of cart 3 (cm/s)

% Check energy and momentum, should be 0 

checkKE_C = sum(.5.*m.*vC.^2) - KE0
% New KE of system after collision C - initial KE (J)

checkP_C = sum(m.*vC) - P0
% New momentum of system after collision C - initial momentum (Ns)

% Check for another collision

if vC(1) > vC(2) || vC(2) > vC(3)
    disp("There is another collision")
else
    disp("There are no more collisions")
end


% ------ Collision #4 ------

% Collision #4 will be between carts 1 and 2

vD = [ 0 0 0 ]; % Initialize vD

vD(1) = (1/m12)*((m(1) - m(2))*vC(1) + 2*m(2)*vC(2));
% New velocity of cart 1 (cm/s)

vD(2) = (1/m12)*(2*m(1)*vC(1) + (m(2) - m(1))*vC(2));
% New velocity of cart 2 (cm/s)

vD(3) = vC(3) % New velocity of cart 3, same as previous (cm/s)

% Check energy and momentum, should be 0 

checkKE_D = sum(.5.*m.*vD.^2) - KE0
% New KE of system after collision D - inital KE (J)

checkP_D = sum(m.*vD) - P0
% New momentum of system after collision D - initial momentum (Ns)

% Check for another collision

if vD(1) > vD(2) || vD(2) > vD(3)
    disp("There is another collision")
else
    disp("There are no more collisions")
end


% ------ Collision #5 ------

% This collision will be between carts 2 and 3

vE = [ 0 0 0 ]; % Initialize vE

vE(1) = vD(1); % New velocity of cart 1, same as previous
vE(2) = (1/m23)*((m(2) - m(3))*vD(2) + 2*m(3)*vD(3));
% New velocity of cart 2 (cm/s)

vE(3) = (1/m23)*(2*m(2)*vD(2) + (m(3) - m(2))*vD(3))
% New velocity of cart 3 (cm/s)

% Check energy and momentum, should be 0 

checkKE_E = sum(.5.*m.*vE.^2) - KE0
% New KE of system after collision E - initial KE (J)

checkP_E = sum(m.*vE) - P0
% New momentum of system after collision E - inital momentum (Ns)

% Check for another collision

if vE(1) > vE(2) || vE(2) > vE(3)
    disp("There is another collision")
else
    disp("There are no more collisions")
end

% There were 5 collisions in total