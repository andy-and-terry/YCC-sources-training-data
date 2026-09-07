-module(fenwick_tree).
-export([new/1, update/3, prefix_sum/2, range_sum/3]).

new(N) -> {N, list_to_tuple(lists:duplicate(N, 0))}.

update(Value, I, {N, Tree}) -> {N, update_tree(Value, I, N, Tree)}.

update_tree(_Value, I, N, Tree) when I > N -> Tree;
update_tree(Value, I, N, Tree) ->
    NewTree = setelement(I, Tree, element(I, Tree) + Value),
    update_tree(Value, I + (I band (-I)), N, NewTree).

prefix_sum(I, {_N, Tree}) -> prefix_sum(I, Tree, 0).

prefix_sum(I, _Tree, Sum) when I =< 0 -> Sum;
prefix_sum(I, Tree, Sum) ->
    prefix_sum(I - (I band (-I)), Tree, Sum + element(I, Tree)).

range_sum(L, R, Fenwick) ->
    prefix_sum(R, Fenwick) - prefix_sum(L - 1, Fenwick).
