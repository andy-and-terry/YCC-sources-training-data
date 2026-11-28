popcount(0, 0) :- !.
popcount(N, C) :-
    N1 is N /\ (N - 1),
    popcount(N1, C0),
    C is C0 + 1.

:- popcount(0b10110111, C), write(C), nl.
