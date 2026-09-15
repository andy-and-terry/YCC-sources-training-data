-module(segment_tree).
-export([build/1, range_sum/3]).

build(Values) ->
    N = length(Values),
    Arr = list_to_tuple(Values),
    Tree = list_to_tuple(lists:duplicate(4 * max(N, 1), 0)),
    {N, build_tree(Arr, 1, 1, N, Tree)}.

build_tree(Arr, Node, Lo, Hi, Tree) when Lo =:= Hi ->
    setelement(Node, Tree, element(Lo, Arr));
build_tree(Arr, Node, Lo, Hi, Tree) ->
    Mid = (Lo + Hi) div 2,
    Tree1 = build_tree(Arr, 2 * Node, Lo, Mid, Tree),
    Tree2 = build_tree(Arr, 2 * Node + 1, Mid + 1, Hi, Tree1),
    setelement(Node, Tree2, element(2 * Node, Tree2) + element(2 * Node + 1, Tree2)).

query(_Tree, _Node, Lo, Hi, L, R) when R < Lo; Hi < L -> 0;
query(Tree, Node, Lo, Hi, L, R) when L =< Lo, Hi =< R -> element(Node, Tree);
query(Tree, Node, Lo, Hi, L, R) ->
    Mid = (Lo + Hi) div 2,
    query(Tree, 2 * Node, Lo, Mid, L, R) + query(Tree, 2 * Node + 1, Mid + 1, Hi, L, R).

range_sum({N, Tree}, L, R) -> query(Tree, 1, 1, N, L, R).
