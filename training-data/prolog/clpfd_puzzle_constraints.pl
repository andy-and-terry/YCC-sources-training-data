:- use_module(library(clpfd)).

puzzle([S, E, N, D] + [M, O, R, E] = [M, O, N, E, Y]) :-
    Vars = [S, E, N, D, M, O, R, Y], Vars ins 0..9, all_different(Vars),
    S * 1000 + E * 100 + N * 10 + D + M * 1000 + O * 100 + R * 10 + E #=
    M * 10000 + O * 1000 + N * 100 + E * 10 + Y,
    M #\= 0, S #\= 0, label(Vars).

queens(N, Qs) :- length(Qs, N), Qs ins 1..N, safe(Qs), labeling([ff], Qs).
safe([]). safe([Q|Qs]) :- no_attack(Q, Qs, 1), safe(Qs).
no_attack(_, [], _).
no_attack(Q, [Q1|Qs], D) :- Q #\= Q1, abs(Q - Q1) #\= D, D1 is D + 1, no_attack(Q, Qs, D1).

main :-
    puzzle(P), format("~w~n", [P]),
    queens(8, Qs), format("~w~n", [Qs]),
    X #> 3, X #< 6, findall(X, label([X]), Xs), format("~w~n", [Xs]),
    Y #= 3 * 4 + 2, format("~w~n", [Y]),
    length(L, 3), L ins 1..3, all_distinct(L), L = [1|_], findall(L, label(L), Ls), length(Ls, Cnt), format("~w~n", [Cnt]),
    Z in 1..10, Z #= 2 * W, W #> 2, fd_dom(Z, Dom), format("~w~n", [Dom]),
    sum([A, B, C], #=, 6), [A, B, C] ins 1..3, A #< B, B #< C, label([A, B, C]), format("~w~n", [[A, B, C]]).
:- initialization(main).
