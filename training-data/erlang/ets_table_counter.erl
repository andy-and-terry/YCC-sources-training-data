-module(ets_table_counter).
-export([run/0]).

run() ->
    T = ets:new(counts, [set, public]),
    ets:insert(T, {hits, 0}),
    ets:update_counter(T, hits, 1),
    ets:update_counter(T, hits, 1),
    ets:lookup(T, hits).
