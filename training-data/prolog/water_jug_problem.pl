% The classic water jug puzzle: given a 4-gallon and a 3-gallon jug,
% measure out an exact amount by filling, emptying and pouring between
% them. Each state(X, Y) is searched breadth-first, same shape as
% bfs_graph.pl but over generated states instead of fixed edges.
capacity(4, 3).

jug_move(state(X, Y), state(X2, Y)) :- capacity(CapX, _), X < CapX, X2 is CapX.
jug_move(state(X, Y), state(X, Y2)) :- capacity(_, CapY), Y < CapY, Y2 is CapY.
jug_move(state(X, Y), state(0, Y)) :- X > 0.
jug_move(state(X, Y), state(X, 0)) :- Y > 0.
jug_move(state(X, Y), state(X2, Y2)) :-
    X > 0, capacity(_, CapY), Y < CapY,
    Pour is min(X, CapY - Y), X2 is X - Pour, Y2 is Y + Pour.
jug_move(state(X, Y), state(X2, Y2)) :-
    Y > 0, capacity(CapX, _), X < CapX,
    Pour is min(Y, CapX - X), Y2 is Y - Pour, X2 is X + Pour.

solve(Start, Goal, Path) :- bfs_states([[Start]], Goal, Path).
bfs_states([[Goal|Rest]|_], Goal, Path) :- !, reverse([Goal|Rest], Path).
bfs_states([[State|Rest]|Others], Goal, Path) :-
    findall([Next, State|Rest],
            (jug_move(State, Next), \+ member(Next, [State|Rest])),
            NewPaths),
    append(Others, NewPaths, Queue),
    bfs_states(Queue, Goal, Path).

:- solve(state(0, 0), state(2, 3), Path), writeln(Path).
