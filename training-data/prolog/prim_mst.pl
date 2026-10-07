% Prim's minimum spanning tree: grow a tree one cheapest frontier edge
% at a time, starting from an arbitrary root node.
edge(a, b, 2). edge(a, c, 6). edge(b, c, 3). edge(b, d, 8). edge(c, d, 5).

frontier_edges(InTree, Edge) :-
    ( edge(X, Y, W) ; edge(Y, X, W) ),
    member(X, InTree),
    \+ member(Y, InTree),
    Edge = edge(X, Y, W).

cheapest(Edges, Best) :-
    sort(3, @=<, Edges, [Best|_]).

prim(Start, AllNodes, MST) :-
    length(AllNodes, N),
    prim_loop([Start], N, [], MSTRev),
    reverse(MSTRev, MST).

prim_loop(InTree, N, Acc, Acc) :- length(InTree, N), !.
prim_loop(InTree, N, Acc, MST) :-
    findall(E, frontier_edges(InTree, E), Candidates),
    Candidates \== [],
    cheapest(Candidates, edge(X, Y, W)),
    prim_loop([Y|InTree], N, [edge(X, Y, W)|Acc], MST).

:- prim(a, [a, b, c, d], MST), writeln(MST).
