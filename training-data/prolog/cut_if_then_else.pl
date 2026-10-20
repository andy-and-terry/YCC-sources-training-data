max(X, Y, X) :- X >= Y, !.
max(_, Y, Y).
:- max(3, 7, M), writeln(M).
:- ( member(Z, [1, 2, 3]), Z > 1 -> writeln(Z) ; writeln(none) ).
