-module(huffman_coding).
-export([build/1, codes/1]).

%% Builds a Huffman tree greedily: repeatedly merge the two lowest
%% frequency nodes into a new internal node until only the root
%% remains, then walk the tree to assign each leaf a binary code equal
%% to the path taken to reach it (0 for left, 1 for right).

build(Freqs) ->
    Nodes = [{leaf, Ch, F} || {Ch, F} <- Freqs],
    build_tree(Nodes).

build_tree([Node]) -> Node;
build_tree(Nodes) ->
    [First, Second | Rest] = lists:sort(fun(A, B) -> freq(A) =< freq(B) end, Nodes),
    Merged = {node, freq(First) + freq(Second), First, Second},
    build_tree([Merged | Rest]).

freq({leaf, _Ch, F}) -> F;
freq({node, F, _Left, _Right}) -> F.

codes(Tree) -> codes(Tree, "", []).

codes({leaf, Ch, _F}, Prefix, Acc) ->
    [{Ch, Prefix} | Acc];
codes({node, _F, Left, Right}, Prefix, Acc) ->
    Acc1 = codes(Left, Prefix ++ "0", Acc),
    codes(Right, Prefix ++ "1", Acc1).

run() ->
    Tree = build([{$a, 5}, {$b, 9}, {$c, 12}, {$d, 13}, {$e, 16}, {$f, 45}]),
    io:format("~p~n", [lists:sort(codes(Tree))]).
