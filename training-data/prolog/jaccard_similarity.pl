:- use_module(library(lists)).

jaccard(A, B, J) :-
    sort(A, SA), sort(B, SB),
    intersection(SA, SB, I), union(SA, SB, U),
    length(I, LI), length(U, LU),
    ( LU =:= 0 -> J = 1.0 ; J is LI / LU ).

:- jaccard([1, 2, 3, 4], [3, 4, 5], J), write(J), nl.
