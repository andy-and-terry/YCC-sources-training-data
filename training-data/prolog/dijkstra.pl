edge(a, b, 4). edge(a, c, 1). edge(c, b, 1). edge(b, d, 1). edge(c, d, 5).

get_dist(Node, Dists, Dist) :- member(Node-Dist, Dists), !.
get_dist(_, _, inf).

update_dist(Node, NewDist, Dists, [Node-NewDist|Rest]) :-
    select(Node-_, Dists, Rest), !.
update_dist(Node, NewDist, Dists, [Node-NewDist|Dists]).

min_unvisited(Dists, Visited, Best) :-
    findall(D-N, (member(N-D, Dists), \+ member(N, Visited), D \= inf), Candidates),
    Candidates \= [],
    sort(Candidates, [_-Best|_]).

relax([], _, Dists, Dists).
relax([edge(_, V, W)|Rest], BestDist, Dists, NewDists) :-
    get_dist(V, Dists, DV),
    Candidate is BestDist + W,
    ( (DV == inf ; Candidate < DV) ->
        update_dist(V, Candidate, Dists, Dists1)
    ; Dists1 = Dists
    ),
    relax(Rest, BestDist, Dists1, NewDists).

dijkstra_step(Nodes, Visited, Dists, Dists) :-
    length(Nodes, N), length(Visited, N), !.
dijkstra_step(Nodes, Visited, Dists, FinalDists) :-
    min_unvisited(Dists, Visited, Best),
    !,
    get_dist(Best, Dists, BestDist),
    findall(edge(Best, V, W), edge(Best, V, W), OutEdges),
    relax(OutEdges, BestDist, Dists, Dists1),
    dijkstra_step(Nodes, [Best|Visited], Dists1, FinalDists).
dijkstra_step(_, _, Dists, Dists).

dijkstra(Nodes, Source, FinalDists) :-
    findall(N-D, (member(N, Nodes), (N == Source -> D = 0 ; D = inf)), InitDists),
    dijkstra_step(Nodes, [], InitDists, FinalDists).

:- dijkstra([a, b, c, d], a, Dists), writeln(Dists).
