-module(lists_flatmap_demo).
-export([run/0]).

run() ->
    Pairs = lists:flatmap(fun(X) -> [X, X * 10] end, [1, 2, 3]),
    io:format("~p~n", [Pairs]),
    Filtered = lists:flatmap(
                 fun(X) when X rem 2 =:= 0 -> [X];
                    (_) -> []
                 end, lists:seq(1, 10)),
    io:format("~p~n", [Filtered]),
    io:format("~p~n", [lists:filtermap(
                         fun(X) when X > 2 -> {true, X * X};
                            (_) -> false
                         end, [1, 2, 3, 4])]).
