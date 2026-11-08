hanoi(0, _, _, _, []) :- !.
hanoi(N, A, B, C, Moves) :-
    N1 is N - 1,
    hanoi(N1, A, C, B, M1),
    hanoi(N1, B, A, C, M2),
    append(M1, [A-C|M2], Moves).

:- hanoi(3, a, b, c, M), length(M, L), format("~w: ~w~n", [L, M]).
