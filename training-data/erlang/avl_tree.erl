-module(avl_tree).
-export([insert/2, inorder/1]).

insert(nil, Value) -> {node, Value, nil, nil, 1};
insert({node, V, L, R, _H}, Value) when Value < V ->
    rebalance({node, V, insert(L, Value), R, 0});
insert({node, V, L, R, _H}, Value) when Value > V ->
    rebalance({node, V, L, insert(R, Value), 0});
insert(Tree, _Value) -> Tree.

inorder(nil) -> [];
inorder({node, V, L, R, _H}) -> inorder(L) ++ [V] ++ inorder(R).

height(nil) -> 0;
height({node, _V, _L, _R, H}) -> H.

node_left({node, _V, L, _R, _H}) -> L.
node_right({node, _V, _L, R, _H}) -> R.

rebalance({node, V, L, R, _}) ->
    NewHeight = 1 + max(height(L), height(R)),
    Node = {node, V, L, R, NewHeight},
    Balance = height(L) - height(R),
    if
        Balance > 1, height(node_left(L)) >= height(node_right(L)) ->
            rotate_right(Node);
        Balance > 1 ->
            rotate_right({node, V, rotate_left(L), R, NewHeight});
        Balance < -1, height(node_right(R)) >= height(node_left(R)) ->
            rotate_left(Node);
        Balance < -1 ->
            rotate_left({node, V, L, rotate_right(R), NewHeight});
        true ->
            Node
    end.

rotate_left({node, V, L, {node, RV, RL, RR, _RH}, _H}) ->
    NewLeft = {node, V, L, RL, 1 + max(height(L), height(RL))},
    {node, RV, NewLeft, RR, 1 + max(height(NewLeft), height(RR))}.

rotate_right({node, V, {node, LV, LL, LR, _LH}, R, _H}) ->
    NewRight = {node, V, LR, R, 1 + max(height(LR), height(R))},
    {node, LV, LL, NewRight, 1 + max(height(LL), height(NewRight))}.
