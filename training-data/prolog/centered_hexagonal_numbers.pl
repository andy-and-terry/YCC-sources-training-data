% 3n(n-1)+1
term(N, V) :- V is ((3 * N) * (N - 1)) + 1.

main :-
    forall(between(1, 15, N),
           ( term(N, V), format("~d -> ~d~n", [N, V]) )).

:- initialization(main).
