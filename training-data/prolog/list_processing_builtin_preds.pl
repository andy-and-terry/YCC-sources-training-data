% Common list predicates and how they behave.
main :-
    L = [3, 1, 4, 1, 5, 9, 2, 6],
    length(L, N), format("length ~w~n", [N]),
    sort(L, S), format("sorted unique ~w~n", [S]),
    msort(L, M), format("msort ~w~n", [M]),
    sort(0, @>=, L, D), format("desc ~w~n", [D]),
    sum_list(L, Sum), max_list(L, Max), min_list(L, Min),
    format("~w ~w ~w~n", [Sum, Max, Min]),
    nth0(2, L, E0), nth1(2, L, E1), format("~w ~w~n", [E0, E1]),
    last(L, La), reverse(L, R), format("~w ~w~n", [La, R]),
    append(X, [9|_], L), format("before 9: ~w~n", [X]),
    exclude([V]>>(V < 3), L, Ex), include([V]>>(V > 3), L, In),
    format("~w ~w~n", [Ex, In]),
    foldl([A, B0, B]>>(B is A + B0), L, 0, F), format("fold ~w~n", [F]),
    numlist(1, 5, NL), maplist([Q, W]>>(W is Q * Q), NL, Sq), format("~w~n", [Sq]),
    list_to_set(L, Set), subtract(L, [1, 9], Sub), format("~w ~w~n", [Set, Sub]),
    delete(L, 1, Del), format("~w~n", [Del]),
    sumlist(NL, S2), format("~w~n", [S2]).
:- initialization(main).
