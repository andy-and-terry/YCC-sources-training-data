edge_cyclic(a, b). edge_cyclic(b, c). edge_cyclic(c, a).
edge_acyclic(d, e). edge_acyclic(e, f).

reachable_cycle(Edges, Node, Path) :-
    member(Node-Next, Edges),
    ( member(Next, Path) -> true
    ; reachable_cycle(Edges, Next, [Next|Path])
    ).

has_cycle(Edges) :-
    findall(N, member(N-_, Edges), NodesDup),
    sort(NodesDup, Nodes),
    member(Start, Nodes),
    reachable_cycle(Edges, Start, [Start]),
    !.

:- findall(A-B, edge_cyclic(A, B), CyclicEdges),
   (has_cycle(CyclicEdges) -> writeln(has_cycle) ; writeln(no_cycle)).
:- findall(A-B, edge_acyclic(A, B), AcyclicEdges),
   (has_cycle(AcyclicEdges) -> writeln(has_cycle) ; writeln(no_cycle)).
