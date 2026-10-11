-module(lists_sublist_split_demo).
-export([run/0]).

run() ->
    L = lists:seq(1, 10),
    io:format("~p~n", [lists:sublist(L, 3)]),
    io:format("~p~n", [lists:sublist(L, 4, 3)]),
    {Front, Back} = lists:split(4, L),
    io:format("~p ~p~n", [Front, Back]),
    io:format("~p~n", [lists:nthtail(7, L)]),
    io:format("~p~n", [lists:last(L)]),
    io:format("~p~n", [lists:nth(5, L)]).
