edge(a, b, 3). edge(a, d, 7). edge(b, c, 2). edge(c, a, 5). edge(c, d, 1). edge(d, a, 2).

nodes([a, b, c, d]).

init_dist(N1, N2, 0) :- N1 == N2, !.
init_dist(N1, N2, D) :- edge(N1, N2, D), !.
init_dist(_, _, inf).

add_dist(inf, _, inf) :- !.
add_dist(_, inf, inf) :- !.
add_dist(A, B, C) :- C is A + B.

min_dist(A, B, A) :- A \= inf, (B == inf ; A =< B), !.
min_dist(_, B, B).

get_dist(I, J, Dists, D) :- member(I-J-D, Dists), !.

update_via(K, Dists0, Dists) :-
    nodes(Nodes),
    findall(
        I-J-NewD,
        ( member(I, Nodes), member(J, Nodes),
          get_dist(I, J, Dists0, DIJ),
          get_dist(I, K, Dists0, DIK),
          get_dist(K, J, Dists0, DKJ),
          add_dist(DIK, DKJ, Through),
          min_dist(Through, DIJ, NewD)
        ),
        Dists
    ).

foldl_nodes([], Dists, Dists).
foldl_nodes([K|Rest], Dists0, Dists) :-
    update_via(K, Dists0, Dists1),
    foldl_nodes(Rest, Dists1, Dists).

floyd_warshall(FinalDists) :-
    nodes(Nodes),
    findall(I-J-D, (member(I, Nodes), member(J, Nodes), init_dist(I, J, D)), InitDists),
    foldl_nodes(Nodes, InitDists, FinalDists).

:- floyd_warshall(Dists),
   forall(member(I-J-D, Dists), format("~w -> ~w: ~w~n", [I, J, D])).
