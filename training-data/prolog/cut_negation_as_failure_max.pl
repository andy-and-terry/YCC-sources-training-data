max(X, Y, X) :- X >= Y, !.
max(_, Y, Y).

not_member(_, []).
not_member(X, [H|T]) :- X \= H, not_member(X, T).

:- max(3, 9, M), write(M), nl.
:- ( not_member(z, [a,b]) -> writeln(absent) ; writeln(present) ).
