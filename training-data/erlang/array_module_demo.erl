-module(array_module_demo).
-export([main/0]).

main() ->
    A0 = array:new(5, {default, 0}),
    A1 = array:set(2, 42, A0),
    A2 = array:set(4, 7, A1),
    io:format("size: ~p~n", [array:size(A2)]),
    io:format("A2[2] = ~p~n", [array:get(2, A2)]),
    io:format("list: ~p~n", [array:to_list(A2)]),
    Squares = array:from_list([X * X || X <- lists:seq(1, 5)]),
    Sum = array:foldl(fun(_Idx, V, Acc) -> V + Acc end, 0, Squares),
    io:format("sum of squares: ~p~n", [Sum]),
    Doubled = array:map(fun(_Idx, V) -> V * 2 end, Squares),
    io:format("doubled: ~p~n", [array:to_list(Doubled)]),
    Grow = array:set(9, x, array:new()),
    io:format("grown size: ~p~n", [array:size(Grow)]).
