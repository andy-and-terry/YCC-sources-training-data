% Dijkstra's shortest-path algorithm over a small directed weighted graph,
% using library(assoc) as the distance map and a greedy min-unvisited pick
% at each step (rather than relaxing every edge like Bellman-Ford would).
:- use_module(library(assoc)).

edge(a, b, 4). edge(a, c, 1). edge(c, b, 2).
edge(b, d, 5). edge(c, d, 8). edge(d, e, 3).

neighbors(Node, Neighbors) :- findall(N-W, edge(Node, N, W), Neighbors).

dijkstra(Source, Nodes, Dists) :-
    findall(N-D, (member(N, Nodes), (N == Source -> D = 0 ; D = inf)), Pairs),
    list_to_assoc(Pairs, DistMap0),
    dijkstra_loop(Nodes, DistMap0, DistMap),
    assoc_to_list(DistMap, Dists).

dijkstra_loop([], DistMap, DistMap) :- !.
dijkstra_loop(Unvisited, DistMap0, DistMap) :-
    select_min(Unvisited, DistMap0, Node),
    !,
    neighbors(Node, Neighbors),
    get_assoc(Node, DistMap0, NodeDist),
    relax_all(Neighbors, NodeDist, DistMap0, DistMap1),
    exclude(==(Node), Unvisited, Rest),
    dijkstra_loop(Rest, DistMap1, DistMap).
dijkstra_loop(_, DistMap, DistMap).

select_min(Unvisited, DistMap, BestNode) :-
    findall(D-N, (member(N, Unvisited), get_assoc(N, DistMap, D), D \= inf), Pairs),
    Pairs \= [],
    keysort(Pairs, [_-BestNode|_]).

relax_all([], _, DistMap, DistMap).
relax_all([N-W|Rest], NodeDist, DistMap0, DistMap) :-
    get_assoc(N, DistMap0, OldDist),
    NewDist is NodeDist + W,
    (   (OldDist == inf ; NewDist < OldDist)
    ->  put_assoc(N, DistMap0, NewDist, DistMap1)
    ;   DistMap1 = DistMap0
    ),
    relax_all(Rest, NodeDist, DistMap1, DistMap).

:- dijkstra(a, [a, b, c, d, e], Dists), writeln(Dists).
