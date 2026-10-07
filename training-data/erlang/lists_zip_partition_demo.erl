-module(lists_zip_partition_demo).
-export([run/0]).

run() ->
    L = lists:seq(1, 10),
    {Evens, Odds} = lists:partition(fun(X) -> X rem 2 =:= 0 end, L),
    io:format("~p ~p~n", [Evens, Odds]),
    io:format("~p~n", [lists:zip([a, b, c], [1, 2, 3])]),
    {Names, Ages} = lists:unzip([{ann, 30}, {bob, 25}]),
    io:format("~p ~p~n", [Names, Ages]),
    io:format("~p~n", [lists:foldl(fun(X, Acc) -> X + Acc end, 0, L)]),
    io:format("~p~n", [lists:splitwith(fun(X) -> X < 4 end, L)]),
    io:format("~p~n", [lists:keysort(2, [{a, 3}, {b, 1}, {c, 2}])]),
    io:format("~p~n", [lists:flatmap(fun(X) -> [X, X * 10] end, [1, 2])]),
    io:format("~p~n", [lists:usort([3, 1, 3, 2, 1])]),
    io:format("~p~n", [lists:mapfoldl(fun(X, S) -> {X * 2, S + X} end, 0, [1, 2, 3])]).
