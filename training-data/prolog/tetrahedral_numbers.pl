% n(n+1)(n+2)/6
term(N, V) :- V is ((N * (N + 1)) * (N + 2)) // 6.

main :-
    forall(between(1, 15, N),
           ( term(N, V), format("~d -> ~d~n", [N, V]) )).

:- initialization(main).
