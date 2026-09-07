-module(ets_table_demo).
-export([run/0]).

run() ->
    Table = ets:new(demo_table, [set]),
    ets:insert(Table, {alice, 30}),
    ets:insert(Table, {bob, 25}),
    ets:insert(Table, {alice, 31}),
    io:format("~p~n", [ets:lookup(Table, alice)]),
    io:format("~p~n", [ets:lookup(Table, carol)]),
    io:format("~p~n", [lists:sort(ets:tab2list(Table))]),
    ets:delete(Table).
