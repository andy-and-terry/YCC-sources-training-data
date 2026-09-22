% Dijkstra's algorithm over a weighted graph. bfs_graph.pl explores an
% unweighted graph level by level; here the frontier is a list of
% Node-Distance pairs and each step greedily expands the pair with the
% smallest distance, which is what makes this Dijkstra rather than plain
% breadth-first search.
edge(a, b, 1).
edge(a, c, 4).
edge(b, c, 2).
edge(b, d, 5).
edge(c, d, 1).

select_min([Pair], Pair, []) :- !.
select_min([Node-Dist|Rest], Min, RestOut) :-
    select_min(Rest, Node2-Dist2, Rest2),
    ( Dist =< Dist2
    -> Min = Node-Dist, RestOut = [Node2-Dist2|Rest2]
    ;  Min = Node2-Dist2, RestOut = [Node-Dist|Rest2]
    ).

dijkstra(Source, Dists) :- dijkstra_search([Source-0], [], Dists).

dijkstra_search([], Visited, Visited).
dijkstra_search(Frontier, Visited, Dists) :-
    Frontier \= [],
    select_min(Frontier, Node-Dist, Rest),
    ( memberchk(Node-_, Visited)
    -> dijkstra_search(Rest, Visited, Dists)
    ;  findall(
           Neighbor-NewDist,
           ( edge(Node, Neighbor, Weight),
             \+ memberchk(Neighbor-_, Visited),
             NewDist is Dist + Weight
           ),
           NewEntries
       ),
       append(Rest, NewEntries, Frontier1),
       dijkstra_search(Frontier1, [Node-Dist|Visited], Dists)
    ).

:- dijkstra(a, Dists),
   memberchk(d-Distance, Dists),
   writeln(Distance).
