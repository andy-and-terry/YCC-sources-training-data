-module(array_module_demo).
-export([run/0]).

run() ->
    A0 = array:new(5, {default, 0}),
    A1 = array:set(0, 10, A0),
    A2 = array:set(3, 30, A1),
    io:format("~p~n", [array:to_list(A2)]),
    io:format("~p~n", [array:get(3, A2)]),
    io:format("~p~n", [array:size(A2)]),
    A3 = array:map(fun(_I, V) -> V + 1 end, A2),
    io:format("~p~n", [array:to_list(A3)]),
    Sum = array:foldl(fun(_I, V, Acc) -> V + Acc end, 0, A3),
    io:format("~p~n", [Sum]),
    Grow = array:set(7, x, array:new()),
    io:format("~p~n", [array:size(Grow)]),
    io:format("~p~n", [array:sparse_to_list(Grow)]),
    io:format("~p~n", [array:from_list([a, b, c])]).
