insert(X, [], [X]).
insert(X, [H|T], [X,H|T]) :- X =< H, !.
insert(X, [H|T], [H|R]) :- insert(X, T, R).

insertion_sort([], []).
insertion_sort([H|T], Sorted) :-
    insertion_sort(T, SortedT),
    insert(H, SortedT, Sorted).

:- insertion_sort([12,11,13,5,6], Sorted), writeln(Sorted).
