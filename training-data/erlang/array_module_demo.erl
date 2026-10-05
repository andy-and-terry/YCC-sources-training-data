-module(array_module_demo).
-export([run/0]).

run() ->
    A0 = array:new(5, {default, 0}),
    A1 = array:set(2, 42, A0),
    A2 = array:set(4, 7, A1),
    io:format("~p~n", [array:to_list(A2)]),
    io:format("get(2) = ~p~n", [array:get(2, A2)]),
    io:format("size = ~p~n", [array:size(A2)]),
    Squares = array:from_list([X * X || X <- lists:seq(1, 5)]),
    io:format("~p~n", [array:foldl(fun(_I, V, Acc) -> Acc + V end, 0, Squares)]),
    Mapped = array:map(fun(I, V) -> I + V end, Squares),
    io:format("~p~n", [array:to_list(Mapped)]),
    Grown = array:set(9, x, array:new()),
    io:format("~p~n", [array:size(Grown)]).
