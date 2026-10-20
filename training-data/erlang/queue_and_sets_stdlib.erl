-module(queue_and_sets_stdlib).
-export([main/0]).

main() ->
    Q0 = queue:new(),
    Q1 = queue:in(1, queue:in(2, Q0)),
    {{value, V}, Q2} = queue:out(Q1),
    io:format("~p ~p~n", [V, queue:to_list(Q2)]),
    S = sets:from_list([1, 2, 3, 2]),
    io:format("~p ~p~n", [sets:size(S), sets:is_element(2, S)]),
    G = gb_trees:from_orddict([{a, 1}, {b, 2}]),
    io:format("~p ~p~n", [gb_trees:lookup(b, G), gb_trees:size(G)]),
    D = orddict:store(z, 1, orddict:from_list([{a, 0}])),
    io:format("~p~n", [D]),
    io:format("~p~n", [array:to_list(array:set(1, x, array:new(3)))]).
