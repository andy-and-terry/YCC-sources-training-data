-module(lists_mapfoldl_demo).
-export([run/0]).

run() ->
    %% number each element while accumulating a running total
    {Numbered, Total} =
        lists:mapfoldl(fun(X, {I, Sum}) -> {{I, X}, {I + 1, Sum + X}} end,
                       {1, 0}, [10, 20, 30]),
    io:format("~p~n~p~n", [Numbered, Total]),
    {Running, Last} = lists:mapfoldl(fun(X, Acc) -> {Acc + X, Acc + X} end, 0, [1, 2, 3, 4]),
    io:format("~p ~p~n", [Running, Last]).
