% insert_interval(+Intervals, +New, -Result) for sorted, disjoint lo-hi pairs.
insert_interval([], Lo-Hi, [Lo-Hi]).
insert_interval([L-H|T], Lo-Hi, [L-H|R]) :-
    H < Lo, !,
    insert_interval(T, Lo-Hi, R).
insert_interval([L-_|_]=All, Lo-Hi, [Lo-Hi|All]) :-
    L > Hi, !.
insert_interval([L-H|T], Lo-Hi, R) :-
    Lo1 is min(Lo, L), Hi1 is max(Hi, H),
    insert_interval(T, Lo1-Hi1, R).

:- insert_interval([1-3, 6-9], 2-5, R), format("~w~n", [R]).  % [1-5,6-9]
