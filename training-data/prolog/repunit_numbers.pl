% Repunits: R_k = (10^k - 1) / 9, built as r = 10r + 1.
repunits(0, _, []) :- !.
repunits(K, R, [R | T]) :-
    K1 is K - 1, R1 is R * 10 + 1,
    repunits(K1, R1, T).

main :-
    repunits(8, 1, L),
    atomic_list_concat(L, ' ', Out),
    writeln(Out).

:- initialization(main).
