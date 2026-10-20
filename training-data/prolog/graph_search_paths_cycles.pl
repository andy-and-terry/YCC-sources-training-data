edge(a, b). edge(b, c). edge(c, d). edge(a, e). edge(e, d). edge(d, a).

path(S, G, P) :- path(S, G, [S], Q), reverse(Q, P).
path(G, G, V, V).
path(S, G, V, P) :- edge(S, N), \+ memberchk(N, V), path(N, G, [N|V], P).

shortest(S, G, P) :-
    findall(L-Pa, (path(S, G, Pa), length(Pa, L)), Ps), keysort(Ps, [_-P|_]).

reachable(S, Rs) :- findall(N, (path(S, N, _), N \== S), L), sort(L, Rs).

bfs(S, G, P) :- bfs_([[S]], G, [S], Q), reverse(Q, P).
bfs_([[G|T]|_], G, _, [G|T]) :- !.
bfs_([[N|T]|Rest], G, Seen, P) :-
    findall([M, N|T], (edge(N, M), \+ memberchk(M, Seen)), Next),
    findall(M, member([M|_], Next), Ms), append(Seen, Ms, Seen1),
    append(Rest, Next, Queue), bfs_(Queue, G, Seen1, P).

main :-
    findall(P, path(a, d, P), Ps), format("~w~n", [Ps]),
    shortest(a, d, SP), format("~w~n", [SP]),
    reachable(a, R), format("~w~n", [R]),
    bfs(a, d, BP), format("~w~n", [BP]).
:- initialization(main).
