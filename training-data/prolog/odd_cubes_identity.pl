:- initialization(main).

cube_from_odds(N, Cube) :-
    Start is N * N - N + 1,
    Last is N - 1,
    findall(V, (between(0, Last, I), V is Start + 2 * I), Vs),
    sum_list(Vs, Cube).

main :-
    forall(between(1, 5, N),
           ( cube_from_odds(N, C),
             ( C =:= N ** 3 -> R = true ; R = false ),
             format("~w ~w ~w~n", [N, C, R]) )).
