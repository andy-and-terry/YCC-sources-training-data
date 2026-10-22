% Perrin numbers: P(0) = 3, P(1) = 0, P(2) = 2, P(n) = P(n-2) + P(n-3)
perrin(0, 3).
perrin(1, 0).
perrin(2, 2).
perrin(N, P) :-
    N > 2,
    N2 is N - 2,
    N3 is N - 3,
    perrin(N2, P2),
    perrin(N3, P3),
    P is P2 + P3.

main :-
    findall(P, (between(0, 14, N), perrin(N, P)), Ps),
    atomic_list_concat(Ps, ' ', Line),
    writeln(Line).

:- initialization(main).
