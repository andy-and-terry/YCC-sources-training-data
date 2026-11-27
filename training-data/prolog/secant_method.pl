f(X, Y) :- Y is X * X - 2.

secant(_, X1, 0, X1) :- !.
secant(X0, X1, N, R) :-
    f(X0, F0), f(X1, F1),
    (   F0 =:= F1 -> R = X1
    ;   Next is X1 - F1 * (X1 - X0) / (F1 - F0),
        (   abs(Next - X1) < 1.0e-12 -> R = Next
        ;   N1 is N - 1, secant(X1, Next, N1, R)
        )
    ).

:- secant(1.0, 2.0, 50, R), format("~10f~n", [R]).
