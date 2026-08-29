merge([], L, L).
merge(L, [], L).
merge([H1|T1], [H2|T2], [H1|R]) :-
    H1 =< H2, !,
    merge(T1, [H2|T2], R).
merge([H1|T1], [H2|T2], [H2|R]) :-
    merge([H1|T1], T2, R).

split([], [], []).
split([X], [X], []).
split([X,Y|T], [X|Xs], [Y|Ys]) :- split(T, Xs, Ys).

merge_sort([], []).
merge_sort([X], [X]) :- !.
merge_sort(L, Sorted) :-
    split(L, L1, L2),
    merge_sort(L1, S1),
    merge_sort(L2, S2),
    merge(S1, S2, Sorted).

:- merge_sort([5,2,9,1,5,6], Sorted), writeln(Sorted).
