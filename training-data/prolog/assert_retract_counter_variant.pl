:- dynamic counter/1.
counter(0).

incr :- retract(counter(N)), N1 is N + 1, assert(counter(N1)).

:- incr, incr, counter(X), format("~w~n", [X]).
