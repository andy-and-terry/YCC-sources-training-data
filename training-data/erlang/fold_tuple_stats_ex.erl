-module(fold_tuple_stats_ex).
-export([main/0]).

main() ->
    {Sum, Count} = lists:foldl(fun(X, {S, C}) -> {S + X, C + 1} end, {0, 0}, [3, 5, 7, 9]),
    io:format("mean=~p~n", [Sum / Count]),
    io:format("~p~n", [lists:sort(fun(A, B) -> A > B end, [3, 1, 2])]).
