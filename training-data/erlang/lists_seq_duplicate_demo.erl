-module(lists_seq_duplicate_demo).
-export([run/0]).

run() ->
    io:format("~p~n", [lists:seq(1, 5)]),
    io:format("~p~n", [lists:seq(10, 0, -5)]),
    io:format("~p~n", [lists:duplicate(3, ab)]),
    io:format("~p~n", [lists:append([[1], [2, 3], []])]),
    io:format("~p~n", [lists:concat([a, 1, "b", 2.5])]),
    io:format("~p~n", [lists:flatten([1, [2, [3, [4]]], 5])]).
