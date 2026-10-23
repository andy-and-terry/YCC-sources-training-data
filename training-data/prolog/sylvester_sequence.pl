% Sylvester's sequence: s(0) = 2, s(n+1) = s(n)^2 - s(n) + 1 (SWI-Prolog integers are unbounded)
sylvester(0, 2).
sylvester(N, S) :-
    N > 0,
    M is N - 1,
    sylvester(M, P),
    S is P * P - P + 1.

main :-
    forall(between(0, 7, I),
           ( sylvester(I, S), format("s(~d) = ~d~n", [I, S]) )).

:- initialization(main).
