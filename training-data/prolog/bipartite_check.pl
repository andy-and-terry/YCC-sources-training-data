edge_cycle(a, b). edge_cycle(b, c). edge_cycle(c, d). edge_cycle(d, a).
edge_triangle(a, b). edge_triangle(b, c). edge_triangle(c, a).

undirected(Edges, UEdges) :-
    findall(A-B, member(A-B, Edges), Fwd),
    findall(B-A, member(A-B, Edges), Bwd),
    append(Fwd, Bwd, UEdges).

neighbors(Node, UEdges, Neighbors) :- findall(N, member(Node-N, UEdges), Neighbors).

color_bfs([], _, Acc, Acc).
color_bfs([Node-Color|Rest], UEdges, Acc, Result) :-
    ( member(Node-_, Acc) ->
        color_bfs(Rest, UEdges, Acc, Result)
    ;   neighbors(Node, UEdges, Ns),
        OtherColor is 1 - Color,
        findall(N-OtherColor, member(N, Ns), Frontier),
        append(Rest, Frontier, Queue),
        color_bfs(Queue, UEdges, [Node-Color|Acc], Result)
    ).

is_bipartite(Edges, Start) :-
    undirected(Edges, UEdges),
    color_bfs([Start-0], UEdges, [], Coloring),
    \+ (member(A-B, Edges), member(A-CA, Coloring), member(B-CB, Coloring), CA =:= CB).

:- findall(A-B, edge_cycle(A, B), CycleEdges),
   (is_bipartite(CycleEdges, a) -> writeln(bipartite) ; writeln(not_bipartite)).
:- findall(A-B, edge_triangle(A, B), TriangleEdges),
   (is_bipartite(TriangleEdges, a) -> writeln(bipartite) ; writeln(not_bipartite)).
