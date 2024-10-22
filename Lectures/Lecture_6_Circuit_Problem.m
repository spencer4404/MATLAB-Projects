% Spencer Iannantuono
% 9/18/2023
% Lecture 6: Solve a circuit problem from the problem sheet

clear

% ------ givens ------ %

V0 = 18; % Source voltage, Volts
R = [4 6 3]; % Resistance, Ohms

% ------ Calculations ------ %

i = [0 0 0]; % Current array
i = zeros(1,3); % Alternative way to show above

R23eq = R(2)*R(3)/(R(2)+R(3)); % Resistance of R2 || R3, ohms
Req = R(1) + R23eq; % Total equivalent resistance, ohms

i(1) = V0/Req; % Crrent for resistor 1, amps

i(2) = i(1) * R(3) / (R(2) + R(3)); % Current for resistor 2, amps

i(3) = i(1)* R(2) / (R(2) + R(3)) % Current for resistor 3, amps

% ------ Voltages ------

v = i .* R % Voltages for each resistor

% ------ KVL + KCL Checks ------

KVL_Check = i(1) - i(2) - i(3) % KCL Check, should be 0

KVL_check_left = V0 - v(1) - v(2) % KVL Check, should be zero (left)
KVL_check_right = v(2) - v(3) % KVL Check, should be zero (right)

% ------ Power ------

P = v .* i % Power for each resistor, watts

% ------ Power check ------

P_Ri = R .* i.^2
P_Rv = v.^2 ./ R

check_PRi = P - P_Ri % Should be 3 zeros