% pell(N, P): P is the N-th Pell number, P(n) = 2*P(n-1) + P(n-2).
pell(0, 0).
pell(1, 1).
pell(N, P) :-
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    pell(N1, P1),
    pell(N2, P2),
    P is 2 * P1 + P2.

main :-
    forall(between(0, 14, I),
           ( pell(I, P), format("P(~d) = ~d~n", [I, P]) )).

:- initialization(main).
