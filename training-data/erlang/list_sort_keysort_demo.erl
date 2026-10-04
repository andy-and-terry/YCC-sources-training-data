-module(list_sort_keysort_demo).
-export([run/0]).

run() ->
    People = [{"Cara", 31}, {"Alex", 25}, {"Bao", 31}, {"Dina", 19}],
    io:format("~p~n", [lists:keysort(2, People)]),
    io:format("~p~n", [lists:sort(fun({_, A}, {_, B}) -> A >= B end, People)]),
    io:format("~p~n", [lists:keyfind("Bao", 1, People)]),
    io:format("~p~n", [lists:keyfind("Zed", 1, People)]),
    io:format("~p~n", [lists:keydelete("Alex", 1, People)]),
    io:format("~p~n", [lists:keystore("Alex", 1, People, {"Alex", 26})]),
    io:format("~p~n", [lists:keymember(19, 2, People)]),
    io:format("~p~n", [lists:keymap(fun(N) -> N + 1 end, 2, People)]),
    io:format("~p~n", [lists:sort([c, a, b])]),
    io:format("~p~n", [lists:reverse(lists:sort([3, 1, 2]))]),
    io:format("~p~n", [lists:sublist(lists:sort([5, 4, 3, 2, 1]), 2, 2)]).
