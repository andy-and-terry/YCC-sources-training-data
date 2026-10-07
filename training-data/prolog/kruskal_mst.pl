% Kruskal's minimum spanning tree: sort edges by weight and greedily add
% each one that connects two different union-find components.
:- dynamic(uf_parent/2).

uf_init(N) :-
    retractall(uf_parent(_, _)),
    numlist(0, N, Nodes),
    forall(member(X, Nodes), assertz(uf_parent(X, X))).

uf_find(X, X) :- uf_parent(X, X), !.
uf_find(X, Root) :- uf_parent(X, P), P \= X, uf_find(P, Root).

uf_union(X, Y) :-
    uf_find(X, RootX),
    uf_find(Y, RootY),
    ( RootX \= RootY -> retract(uf_parent(RootX, RootX)), assertz(uf_parent(RootX, RootY)) ; true ).

edge(0, 1, 4). edge(0, 2, 1). edge(2, 1, 2). edge(1, 3, 5). edge(2, 3, 8).

kruskal(NumNodes, MST) :-
    uf_init(NumNodes),
    findall(W-(X-Y), edge(X, Y, W), Edges),
    keysort(Edges, Sorted),
    kruskal_edges(Sorted, [], MSTRev),
    reverse(MSTRev, MST).

kruskal_edges([], MST, MST).
kruskal_edges([W-(X-Y)|Rest], Acc, MST) :-
    uf_find(X, RootX),
    uf_find(Y, RootY),
    ( RootX \= RootY
    -> uf_union(X, Y), kruskal_edges(Rest, [X-Y-W|Acc], MST)
    ;  kruskal_edges(Rest, Acc, MST)
    ).

:- kruskal(3, MST), writeln(MST).
