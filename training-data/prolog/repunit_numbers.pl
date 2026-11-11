% Repunits: numbers made only of the digit 1.
repunits(0, _, []) :- !.
repunits(N, R0, [R|Rs]) :-
    R is R0 * 10 + 1,
    N1 is N - 1,
    repunits(N1, R, Rs).

:- repunits(5, 0, L), print(L), nl.
