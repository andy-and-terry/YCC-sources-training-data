% Shoelace polygon area.
cross(X1-Y1, X2-Y2, C) :- C is X1 * Y2 - X2 * Y1.
area(Pts, A) :-
    Pts = [First|Rest], append(Rest, [First], Next),
    maplist(cross, Pts, Next, Cs), sum_list(Cs, S), A is abs(S) / 2.
:- area([0-0, 4-0, 4-3, 0-3], A), print(A), nl.
