% 
% Volsay problem in MiniZinc.
% 
%  From OPL model volsay.mod.
%
% Compare with the Comet model:
% http://www.hakank.org/comet/volsay.co

% 
% This MiniZinc model was created by Hakan Kjellerstrand, hakank@bonetmail.com
% See also my MiniZinc page: http://www.hakank.org/minizinc
%

% include "globals.mzn"; 

var 0.0..100.0: Gas;
var 0.0..100.0: Chloride;

var 0.0..10000.0: z;

% solve maximize z;
solve :: float_search([Gas,Chloride,z], 0.00001, input_order, indomain_split, complete) maximize z;

constraint
  z = 40.0 * Gas + 50.0 * Chloride /\
  Gas + Chloride <= 50.0 /\
  3.0 * Gas + 4.0 * Chloride <= 180.0

;

output [
"Gas: " ++ show(Gas) ++ "\n"++
"Chloride: " ++ show(Chloride) ++ "\n"++
"z: " ++ show(z) ++ "\n"
];
