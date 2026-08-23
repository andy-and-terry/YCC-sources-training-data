-module(binary_tree).
-export([insert/2, inorder/1]).

insert(nil, Value) -> {node, Value, nil, nil};
insert({node, V, L, R}, Value) when Value < V ->
    {node, V, insert(L, Value), R};
insert({node, V, L, R}, Value) when Value > V ->
    {node, V, L, insert(R, Value)};
insert(Tree, _Value) -> Tree.

inorder(nil) -> [];
inorder({node, V, L, R}) -> inorder(L) ++ [V] ++ inorder(R).
