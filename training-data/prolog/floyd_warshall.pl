% Floyd-Warshall all-pairs shortest paths via dynamic dist/3 facts,
% relaxed through every possible intermediate node K.
:- dynamic(dist/3).

edge(a, b, 3). edge(b, c, 1). edge(a, c, 7). edge(c, d, 2). edge(b, d, 5).

init_dist(Nodes) :-
    retractall(dist(_, _, _)),
    forall(member(N, Nodes), assertz(dist(N, N, 0))),
    forall(edge(X, Y, W), assertz(dist(X, Y, W))).

relax(Nodes) :-
    forall(member(K, Nodes),
        forall(member(I, Nodes),
            forall(member(J, Nodes), try_relax(I, J, K)))).

try_relax(I, J, K) :-
    dist(I, K, Dik), dist(K, J, Dkj), !,
    ( dist(I, J, Dij) -> true ; Dij = inf ),
    New is Dik + Dkj,
    ( (Dij == inf ; New < Dij)
    -> ( retractall(dist(I, J, _)), assertz(dist(I, J, New)) )
    ;  true
    ).
try_relax(_, _, _).

:- init_dist([a, b, c, d]),
   relax([a, b, c, d]),
   forall(dist(a, X, D), format("a -> ~w = ~w~n", [X, D])).
