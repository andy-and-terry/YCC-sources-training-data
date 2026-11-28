% equilibrium_index(+List, -Index): 0-based index where left sum equals right sum.
equilibrium_index(List, Index) :-
    sum_list(List, Total),
    eq_(List, 0, 0, Total, Index).

eq_([V|_], I, Left, Total, I) :- Left =:= Total - Left - V, !.
eq_([V|T], I, Left, Total, R) :- I1 is I + 1, L1 is Left + V, eq_(T, I1, L1, Total, R).

:- equilibrium_index([1, 7, 3, 6, 5, 6], I), format("~w~n", [I]).  % 3
