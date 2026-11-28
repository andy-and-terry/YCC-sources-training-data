manhattan([], [], 0).
manhattan([X|Xs], [Y|Ys], D) :-
    manhattan(Xs, Ys, D0),
    D is D0 + abs(X - Y).

:- manhattan([1, 2], [4, 6], D), write(D), nl.
