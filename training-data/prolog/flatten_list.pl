my_flatten([], []) :- !.
my_flatten([H|T], Flat) :-
    !,
    my_flatten(H, FH),
    my_flatten(T, FT),
    append(FH, FT, Flat).
my_flatten(X, [X]).

:- my_flatten([1, [2, [3, 4]], [], [[5]]], F), writeln(F).
:- my_flatten(a, F), writeln(F).
:- flatten([a, [b, [c]], d], F), writeln(F).
