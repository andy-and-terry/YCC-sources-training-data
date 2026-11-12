-module(lists_hof).
-export([main/0]).
main() ->
    L = lists:seq(1, 10),
    io:format("~p~n", [lists:foldl(fun(X, A) -> X + A end, 0, L)]),
    io:format("~p~n", [lists:filter(fun(X) -> X rem 3 =:= 0 end, L)]),
    io:format("~p~n", [lists:zip(lists:seq(1, 3), [a, b, c])]).
