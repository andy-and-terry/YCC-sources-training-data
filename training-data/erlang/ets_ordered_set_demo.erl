-module(ets_ordered_set_demo).
-export([run/0]).

run() ->
    T = ets:new(scores, [ordered_set]),
    [ets:insert(T, {K, V}) || {K, V} <- [{30, c}, {10, a}, {20, b}, {40, d}]],
    io:format("~p~n", [ets:tab2list(T)]),
    io:format("~p~n", [ets:first(T)]),
    io:format("~p~n", [ets:next(T, 20)]),
    io:format("~p~n", [ets:last(T)]),
    io:format("~p~n", [ets:prev(T, 10)]),
    ets:delete(T).
