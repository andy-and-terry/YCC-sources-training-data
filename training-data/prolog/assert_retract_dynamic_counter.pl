:- dynamic counter/1.
counter(0).

bump :- retract(counter(N)), N1 is N + 1, assertz(counter(N1)).

:- bump, bump, counter(X), write(X), nl.
