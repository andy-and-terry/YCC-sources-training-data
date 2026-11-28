chebyshev([], [], 0).
chebyshev([X|Xs], [Y|Ys], D) :-
    chebyshev(Xs, Ys, D0),
    D is max(D0, abs(X - Y)).

:- chebyshev([1, 2], [4, 6], D), write(D), nl.
