-module(lists_keyfind_demo).
-export([main/0]).

main() ->
    People = [{bob, 25, london}, {ann, 31, paris}, {cy, 19, rome}],
    io:format("~p~n", [lists:keyfind(ann, 1, People)]),
    io:format("~p~n", [lists:keyfind(zed, 1, People)]),
    io:format("~p~n", [lists:keysort(2, People)]),
    io:format("~p~n", [lists:keymember(rome, 3, People)]),
    io:format("~p~n", [lists:keyreplace(bob, 1, People, {bob, 26, london})]),
    io:format("~p~n", [lists:keydelete(cy, 1, People)]),
    io:format("~p~n", [lists:keymap(fun(A) -> A + 1 end, 2, People)]),
    io:format("~p~n", [lists:keystore(dee, 1, People, {dee, 40, oslo})]),
    io:format("~p~n", [lists:keytake(ann, 1, People)]),
    io:format("~p~n", [lists:sort(fun({_, A, _}, {_, B, _}) -> A >= B end, People)]).
