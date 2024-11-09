% Probabilidades para variáveis independentes
0.2::str_snow_covered.  % Probabilidade de rua coberta de neve
0.3::dyn_flywheel_worn. % Probabilidade do volante do dínamo desgastado
0.95::light_bulb_ok.    % Probabilidade da lâmpada estar em bom estado
0.9::cable_intact.      % Probabilidade do cabo estar em bom estado

% Probabilidade condicional de dynamo_sliding (dínamo deslizando) dado str_snow_covered (rua coberta de neve)
0.85::dynamo_sliding :- str_snow_covered.
0.2::dynamo_sliding :- \+str_snow_covered.

% Probabilidade condicional de voltage (tensão presente) dado dynamo_sliding (dínamo deslizando)
0.8::voltage :- dynamo_sliding.
0.1::voltage :- \+dynamo_sliding.

% Probabilidade condicional de light_on (luz ligada) dado voltage, light_bulb_ok, cable_intact, e dyn_flywheel_worn
0.9::light_on :- voltage, light_bulb_ok, cable_intact, \+dyn_flywheel_worn.
0.7::light_on :- voltage, light_bulb_ok, cable_intact, dyn_flywheel_worn.
0.6::light_on :- voltage, light_bulb_ok, \+cable_intact, \+dyn_flywheel_worn.
0.4::light_on :- voltage, light_bulb_ok, \+cable_intact, dyn_flywheel_worn.
0.5::light_on :- voltage, \+light_bulb_ok, cable_intact, \+dyn_flywheel_worn.
0.3::light_on :- voltage, \+light_bulb_ok, cable_intact, dyn_flywheel_worn.
0.2::light_on :- \+voltage, light_bulb_ok, cable_intact, \+dyn_flywheel_worn.
0.1::light_on :- \+voltage, \+light_bulb_ok, \+cable_intact, \+dyn_flywheel_worn.

% Evidência de que a rua está coberta de neve
evidence(str_snow_covered,true).

% Consulta para a probabilidade de tensão (voltage)
query(voltage).
