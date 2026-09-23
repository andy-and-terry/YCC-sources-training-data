% Depth-first search over a small directed graph: follows one branch all
% the way down before backtracking, unlike bfs_graph.pl's queue of paths.
edge(a, b). edge(a, c). edge(b, d). edge(c, d). edge(d, e).

dfs(Start, Goal, Path) :- dfs(Start, Goal, [Start], Path).
dfs(Goal, Goal, Visited, Path) :- !, reverse(Visited, Path).
dfs(Node, Goal, Visited, Path) :-
    edge(Node, Next),
    \+ member(Next, Visited),
    dfs(Next, Goal, [Next|Visited], Path).

dfs_order(Start, Order) :- dfs_visit([Start], [], RevOrder), reverse(RevOrder, Order).
dfs_visit([], Visited, Visited).
dfs_visit([Node|Rest], Visited, Order) :-
    ( member(Node, Visited)
    -> dfs_visit(Rest, Visited, Order)
    ;  findall(N, edge(Node, N), Neighbors),
       append(Neighbors, Rest, Agenda),
       dfs_visit(Agenda, [Node|Visited], Order)
    ).

:- dfs(a, e, Path), writeln(Path).
:- dfs_order(a, Order), writeln(Order).
