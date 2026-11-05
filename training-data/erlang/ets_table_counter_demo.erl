-module(ets_table_counter_demo).
-export([run/0]).

run() ->
    T = ets:new(counts, [set]),
    [ets:update_counter(T, W, 1, {W, 0}) || W <- [a, b, a, a]],
    io:format("~p~n", [lists:sort(ets:tab2list(T))]).
