% n(2n^2+1)/3
term(N, V) :- V is (N * (((2 * N) * N) + 1)) // 3.

main :-
    forall(between(1, 15, N),
           ( term(N, V), format("~d -> ~d~n", [N, V]) )).

:- initialization(main).
