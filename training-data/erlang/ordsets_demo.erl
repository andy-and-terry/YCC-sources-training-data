-module(ordsets_demo).
-export([run/0]).

run() ->
    S1 = ordsets:from_list([3, 1, 2, 1]),
    S2 = ordsets:from_list([2, 3, 4]),
    io:format("~p~n", [S1]),
    io:format("~p~n", [ordsets:union(S1, S2)]),
    io:format("~p~n", [ordsets:intersection(S1, S2)]),
    io:format("~p~n", [ordsets:subtract(S1, S2)]),
    io:format("~p~n", [ordsets:is_element(2, S1)]),
    io:format("~p~n", [ordsets:add_element(5, S1)]).
