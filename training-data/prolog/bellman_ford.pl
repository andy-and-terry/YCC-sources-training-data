% Bellman-Ford shortest paths: relax every edge |V|-1 times, tolerating
% negative weights (unlike a plain BFS/Dijkstra over these facts).
:- dynamic(sp/2).

edge(a, b, 4). edge(a, c, 1). edge(c, b, 2). edge(b, d, 5). edge(c, d, 8).

init_sp(Source, Nodes) :-
    retractall(sp(_, _)),
    forall(member(N, Nodes), (N == Source -> assertz(sp(N, 0)) ; assertz(sp(N, inf)))).

relax_once :-
    forall(edge(U, V, W),
        ( sp(U, Du), Du \== inf,
          NewDist is Du + W,
          ( sp(V, Dv), (Dv == inf ; NewDist < Dv) )
        -> ( retractall(sp(V, _)), assertz(sp(V, NewDist)) )
        ;  true
        )).

bellman_ford(Source, Nodes) :-
    init_sp(Source, Nodes),
    length(Nodes, N),
    Iterations is N - 1,
    forall(between(1, Iterations, _), relax_once).

:- bellman_ford(a, [a, b, c, d]),
   forall(sp(X, D), format("~w: ~w~n", [X, D])).
