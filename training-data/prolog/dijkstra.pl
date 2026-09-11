edge(a, b, 4). edge(a, c, 1). edge(c, b, 2). edge(b, d, 5). edge(c, d, 8). edge(d, e, 3).

path_cost(Node, Node, [Node], 0).
path_cost(Start, Goal, [Start|Path], Cost) :-
    edge(Start, Next, Weight),
    path_cost(Next, Goal, Path, RestCost),
    Cost is Weight + RestCost.

shortest_path(Start, Goal, BestPath, BestCost) :-
    findall(Cost-Path, path_cost(Start, Goal, Path, Cost), Solutions),
    keysort(Solutions, [BestCost-BestPath|_]).

:- shortest_path(a, e, Path, Cost), format("~w (cost ~w)~n", [Path, Cost]).
