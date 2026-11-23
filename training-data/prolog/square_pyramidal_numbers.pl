% n(n+1)(2n+1)/6
term(N, V) :- V is ((N * (N + 1)) * ((2 * N) + 1)) // 6.

main :-
    forall(between(1, 15, N),
           ( term(N, V), format("~d -> ~d~n", [N, V]) )).

:- initialization(main).
