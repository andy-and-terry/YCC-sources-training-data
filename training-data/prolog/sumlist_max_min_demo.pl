% Numeric list aggregates using the standard list library.
:- use_module(library(lists)).

average(List, Avg) :-
    List \== [],
    sum_list(List, Sum),
    length(List, N),
    Avg is Sum / N.

:- sum_list([3, 1, 4, 1, 5], S), write(S), nl.
:- max_list([3, 1, 4, 1, 5], M), write(M), nl.
:- min_list([3, 1, 4, 1, 5], M), write(M), nl.
:- average([2, 4, 6, 8], A), write(A), nl.
:- numlist(1, 5, L), sumlist(L, S), write(L-S), nl.
:- max_member(M, [apple, pear, fig]), write(M), nl.
:- last([a, b, c], X), write(X), nl.
