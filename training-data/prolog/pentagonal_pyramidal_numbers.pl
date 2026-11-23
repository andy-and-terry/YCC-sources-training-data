% n^2(n+1)/2
term(N, V) :- V is ((N * N) * (N + 1)) // 2.

main :-
    forall(between(1, 15, N),
           ( term(N, V), format("~d -> ~d~n", [N, V]) )).

:- initialization(main).
