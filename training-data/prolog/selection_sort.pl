select_min(X, [], X, []).
select_min(X, [H|T], Min, [X|R]) :-
    X > H, !,
    select_min(H, T, Min, R).
select_min(X, [H|T], Min, [H|R]) :-
    select_min(X, T, Min, R).

selection_sort([], []).
selection_sort([H|T], [Min|Sorted]) :-
    select_min(H, T, Min, Rest),
    selection_sort(Rest, Sorted).

:- selection_sort([5,3,8,1,9,2], Sorted), writeln(Sorted).
