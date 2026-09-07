edge(a, b). edge(a, c). edge(b, d). edge(c, d). edge(d, e).

neighbors(Node, Neighbors) :- findall(N, edge(Node, N), Neighbors).

bfs(Start, Goal, Path) :- bfs_search([[Start]], Goal, Path).

bfs_search([[Goal|Rest]|_], Goal, Path) :- !, reverse([Goal|Rest], Path).
bfs_search([[Node|Rest]|Others], Goal, Path) :-
    neighbors(Node, Neighbors),
    findall([N, Node|Rest],
            (member(N, Neighbors), \+ member(N, [Node|Rest])),
            NewPaths),
    append(Others, NewPaths, Queue),
    bfs_search(Queue, Goal, Path).

:- bfs(a, e, Path), writeln(Path).
