%
% Least diff problen in ASP.
%
% The program solves the following problem:
%
% What is the smallest difference between two numbers X - Y
% if you must use all the digits (0..9) exactly once.
% 
%
% This was created by Hakan Kjellerstrand, hakank@bonetmail.com
% See also http://www.hakank.org/answer_set_programming/
%


letter(a;b;c;d;e;f;g;h;i;j).
values(0..9).

% for the difference (ABCDE-FGHIJ)
values2(0..1000).

% exact 1 occurrence of each letter
1 { x(L,Val) : values(Val) } 1 :- letter(L).

% exact 1 occurrences of each value
1 { x(L,Val) : letter(L) } 1 :- values(Val).

% no digit can be given to two different symbols
% :- letter(L), letter(L1), x(L,V1), x(L1,V1), L != L1.

% difference
1 { y(diff, Val) : values2(Val) } 1.

least_diff :- 
   values(A;B;C;D;E;F;G;H;I;J),
   x(a,A), x(b,B), x(c,C), x(d,D), x(e,E), 
   x(f,F), x(g,G), x(h,H), x(i,I), x(j,J), 
   A > 0, 
   F > 0,
   y(diff, Diff),
   values2(Diff), 
   Diff == 10000*A+1000*B+100*C+10*D+E - 10000*F+1000*G+100*H+10*I+J.

:- not least_diff.


#minimize [y(diff, Diff) : values2(Diff) = Diff].

#hide.
#show x(L,Val).
#show y(L, Val).

