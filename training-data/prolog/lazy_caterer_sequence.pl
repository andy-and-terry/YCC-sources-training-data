% n(n+1)/2+1
term(N, V) :- V is ((N * (N + 1)) // 2) + 1.

main :-
    forall(between(1, 15, N),
           ( term(N, V), format("~d -> ~d~n", [N, V]) )).

:- initialization(main).
