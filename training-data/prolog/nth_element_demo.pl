% Positional access: nth0/3 and nth1/3 work in both directions.
:- use_module(library(lists)).

:- nth0(0, [a, b, c], X), write(X), nl.
:- nth1(1, [a, b, c], X), write(X), nl.
:- nth1(I, [a, b, c, b], b), write(I), write(' '), fail ; nl.
:- nth0(1, L, x, [a, b]), write(L), nl.
:- nth1(2, [a, b, c], E, Rest), write(E-Rest), nl.

replace_nth0(Index, List, New, Result) :-
    nth0(Index, List, _, Rest),
    nth0(Index, Result, New, Rest).

:- replace_nth0(2, [a, b, c, d], z, R), write(R), nl.
