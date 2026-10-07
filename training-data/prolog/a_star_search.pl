% A* search: like Dijkstra but the frontier is ranked by G + heuristic
% rather than G alone, so a good heuristic prunes the search sooner.
edge(a, b, 1). edge(a, c, 4). edge(b, c, 2). edge(b, d, 5). edge(c, d, 1).
heuristic(a, 3). heuristic(b, 2). heuristic(c, 1). heuristic(d, 0).

astar(Start, Goal, Path, Cost) :-
    astar_search([node(Start, [Start], 0)], Goal, Path, Cost).

astar_search(Frontier, Goal, Path, Cost) :-
    select_best(Frontier, node(Node, Path0, G), Rest),
    ( Node == Goal
    -> Path = Path0, Cost = G
    ;  findall(node(Next, [Next|Path0], NewG),
               ( edge(Node, Next, W), NewG is G + W ),
               Expanded),
       append(Rest, Expanded, NewFrontier),
       astar_search(NewFrontier, Goal, Path, Cost)
    ).

select_best([N], N, []) :- !.
select_best([N1|Rest], Best, Others) :-
    select_best(Rest, Best0, Rest0),
    f_score(N1, F1), f_score(Best0, F0),
    ( F1 =< F0 -> Best = N1, Others = [Best0|Rest0] ; Best = Best0, Others = [N1|Rest0] ).

f_score(node(Node, _, G), F) :- heuristic(Node, H), F is G + H.

:- astar(a, d, Path, Cost),
   reverse(Path, Forward),
   format("path=~w cost=~w~n", [Forward, Cost]).
