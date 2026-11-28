-module(ets_table_counter).
-export([main/0]).

main() ->
    T = ets:new(t, [set]),
    ets:insert(T, {hits, 0}),
    [ets:update_counter(T, hits, 1) || _ <- lists:seq(1, 5)],
    io:format("~p~n", [ets:lookup(T, hits)]).
