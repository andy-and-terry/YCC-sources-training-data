% max_area(+Heights, -Area) with two pointers over a list converted to a compound term.
max_area(Hs, Area) :-
    Term =.. [h|Hs],
    functor(Term, _, N),
    walk(Term, 1, N, 0, Area).

walk(_, Lo, Hi, Best, Best) :- Lo >= Hi, !.
walk(T, Lo, Hi, Best, Area) :-
    arg(Lo, T, A), arg(Hi, T, B),
    Cur is min(A, B) * (Hi - Lo),
    Best1 is max(Best, Cur),
    (   A < B
    ->  Lo1 is Lo + 1, walk(T, Lo1, Hi, Best1, Area)
    ;   Hi1 is Hi - 1, walk(T, Lo, Hi1, Best1, Area)
    ).

:- max_area([1, 8, 6, 2, 5, 4, 8, 3, 7], A), format("~w~n", [A]).  % 49
