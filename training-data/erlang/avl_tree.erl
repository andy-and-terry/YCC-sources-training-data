-module(avl_tree).
-export([insert/2, inorder/1]).

height(nil) -> 0;
height({node, _, _, _, H}) -> H.

make_node(V, L, R) -> {node, V, L, R, 1 + max(height(L), height(R))}.

balance_factor(nil) -> 0;
balance_factor({node, _, L, R, _}) -> height(L) - height(R).

rotate_left({node, V, L, {node, RV, RL, RR, _}, _}) ->
    make_node(RV, make_node(V, L, RL), RR).

rotate_right({node, V, {node, LV, LL, LR, _}, R, _}) ->
    make_node(LV, LL, make_node(V, LR, R)).

balance(Node) ->
    BF = balance_factor(Node),
    if
        BF > 1 ->
            {node, V, L, R, _} = Node,
            case balance_factor(L) < 0 of
                true -> rotate_right(make_node(V, rotate_left(L), R));
                false -> rotate_right(Node)
            end;
        BF < -1 ->
            {node, V, L, R, _} = Node,
            case balance_factor(R) > 0 of
                true -> rotate_left(make_node(V, L, rotate_right(R)));
                false -> rotate_left(Node)
            end;
        true ->
            Node
    end.

insert(nil, Value) -> make_node(Value, nil, nil);
insert({node, V, L, R, _}, Value) when Value < V ->
    balance(make_node(V, insert(L, Value), R));
insert({node, V, L, R, _}, Value) when Value > V ->
    balance(make_node(V, L, insert(R, Value)));
insert(Tree, _Value) -> Tree.

inorder(nil) -> [];
inorder({node, V, L, R, _}) -> inorder(L) ++ [V] ++ inorder(R).
