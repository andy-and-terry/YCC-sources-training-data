-module(ets_table_counter_ex).
-export([main/0]).

main() ->
    T = ets:new(counts, [set, public]),
    [ets:update_counter(T, W, 1, {W, 0}) || W <- [a, b, a, c, a]],
    io:format("~p~n", [lists:sort(ets:tab2list(T))]).
