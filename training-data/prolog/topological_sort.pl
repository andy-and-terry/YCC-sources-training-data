edge(a, b). edge(a, c). edge(b, d). edge(c, d).

visit(Node, Visited, Visited, Order, Order) :- member(Node, Visited), !.
visit(Node, Visited, Visited2, Order, Order2) :-
    findall(Dep, edge(Node, Dep), Deps),
    visit_all(Deps, [Node|Visited], Visited1, Order, Order1),
    Visited2 = Visited1,
    append(Order1, [Node], Order2).

visit_all([], Visited, Visited, Order, Order).
visit_all([D|Ds], Visited, VisitedOut, Order, OrderOut) :-
    visit(D, Visited, Visited1, Order, Order1),
    visit_all(Ds, Visited1, VisitedOut, Order1, OrderOut).

:- visit_all([a,b,c,d], [], _, [], Order), writeln(Order).
