-module(lists_sum_max_demo).
-export([run/0]).

run() ->
    L = [3, 9, -2, 7, 4],
    io:format("sum=~p max=~p min=~p~n", [lists:sum(L), lists:max(L), lists:min(L)]),
    io:format("product=~p~n", [lists:foldl(fun(X, A) -> X * A end, 1, L)]),
    Avg = lists:sum(L) / length(L),
    io:format("avg=~.2f~n", [Avg]).
