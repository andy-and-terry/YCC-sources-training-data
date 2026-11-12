max(X, Y, X) :- X >= Y, !.
max(_, Y, Y).
:- initialization(main).
main :- max(3, 7, M), writeln(M), ( \+ member(z, [a,b]) -> writeln(absent) ; true ).
