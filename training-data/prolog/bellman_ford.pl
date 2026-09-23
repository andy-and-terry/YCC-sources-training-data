:- use_module(library(assoc)).

% Bellman-Ford relaxes every edge |V| - 1 times, which (unlike Dijkstra)
% still works correctly with negative edge weights as long as there is no
% negative-weight cycle reachable from the source.
edge(a, b, 4). edge(a, c, 5). edge(b, c, -3). edge(c, d, 2). edge(b, d, 6).

nodes([a, b, c, d]).

relax_all([], Dist, Dist).
relax_all([edge(From, To, Weight)|Rest], Dist0, DistOut) :-
    get_assoc(From, Dist0, FromDist),
    (   FromDist == inf
    ->  Dist1 = Dist0
    ;   get_assoc(To, Dist0, ToDist),
        NewDist is FromDist + Weight,
        (   (ToDist == inf ; NewDist < ToDist)
        ->  put_assoc(To, Dist0, NewDist, Dist1)
        ;   Dist1 = Dist0
        )
    ),
    relax_all(Rest, Dist1, DistOut).

relax_n_times(0, Dist, Dist) :- !.
relax_n_times(N, Dist0, DistFinal) :-
    N > 0,
    findall(edge(F, T, W), edge(F, T, W), Edges),
    relax_all(Edges, Dist0, Dist1),
    N1 is N - 1,
    relax_n_times(N1, Dist1, DistFinal).

bellman_ford(Source, Dists) :-
    nodes(Nodes),
    findall(N-D, (member(N, Nodes), (N == Source -> D = 0 ; D = inf)), Pairs),
    list_to_assoc(Pairs, Dist0),
    length(Nodes, NumNodes),
    Iterations is NumNodes - 1,
    relax_n_times(Iterations, Dist0, DistFinal),
    assoc_to_list(DistFinal, Dists).

:- bellman_ford(a, Dists), writeln(Dists).
