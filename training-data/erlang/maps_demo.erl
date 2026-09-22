-module(maps_demo).
-export([run/0]).

run() ->
    M1 = #{alice => 30, bob => 25},
    M2 = maps:put(carol, 40, M1),
    M3 = maps:update_with(alice, fun(Age) -> Age + 1 end, M2),
    io:format("~p~n", [maps:get(alice, M3)]),
    io:format("~p~n", [maps:find(dave, M3)]),
    io:format("~p~n", [maps:size(M3)]),
    Merged = maps:merge(M3, #{eve => 22}),
    io:format("~p~n", [lists:sort(maps:to_list(Merged))]),
    Doubled = maps:map(fun(_K, V) -> V * 2 end, Merged),
    io:format("~p~n", [lists:sort(maps:to_list(Doubled))]).
