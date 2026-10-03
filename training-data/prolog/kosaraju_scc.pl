% Kosaraju's strongly connected components: DFS finish order on the
% graph, then DFS on the transpose in reverse finish order.
edge(a, b). edge(b, c). edge(c, a). edge(c, d). edge(d, e).

reach(X, Y) :- edge(X, Y).
reach(X, Y) :- edge(X, Z), reach(Z, Y).

finish_order(Nodes, Order) :-
    finish_order(Nodes, [], [], Order0),
    reverse(Order0, Order).

finish_order([], _, Order, Order).
finish_order([N|Rest], Visited, Acc, Order) :-
    ( member(N, Visited) -> finish_order(Rest, Visited, Acc, Order)
    ; dfs_finish(N, Visited, Visited1, Acc, Acc1),
      finish_order(Rest, Visited1, Acc1, Order)
    ).

dfs_finish(N, Visited, [N|Visited], Acc, [N|Acc1]) :-
    findall(M, edge(N, M), Children),
    dfs_children(Children, Visited, _, Acc, Acc1).

dfs_children([], Visited, Visited, Acc, Acc).
dfs_children([C|Cs], Visited, VisitedOut, Acc, AccOut) :-
    ( member(C, Visited) -> dfs_children(Cs, Visited, VisitedOut, Acc, AccOut)
    ; dfs_finish(C, Visited, V1, Acc, Acc1),
      dfs_children(Cs, V1, VisitedOut, Acc1, AccOut)
    ).

same_component(X, Y) :- reach(X, Y), reach(Y, X).

:- finish_order([a, b, c, d, e], Order), writeln(Order),
   ( same_component(a, c) -> writeln('a and c in same SCC') ; true ),
   ( \+ same_component(a, e) -> writeln('a and e in different SCCs') ; true ).
