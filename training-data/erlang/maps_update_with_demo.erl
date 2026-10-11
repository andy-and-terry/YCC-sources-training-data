-module(maps_update_with_demo).
-export([run/0, count/1]).

count(Words) ->
    lists:foldl(
      fun(W, Acc) -> maps:update_with(W, fun(N) -> N + 1 end, 1, Acc) end,
      #{}, Words).

run() ->
    Counts = count([a, b, a, c, b, a]),
    io:format("~p~n", [lists:sort(maps:to_list(Counts))]),
    io:format("~p~n", [maps:get(z, Counts, 0)]),
    io:format("~p~n", [maps:find(a, Counts)]),
    io:format("~p~n", [maps:merge(#{x => 1, y => 2}, #{y => 20, z => 30})]).
