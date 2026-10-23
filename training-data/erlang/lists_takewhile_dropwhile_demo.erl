-module(lists_takewhile_dropwhile_demo).
-export([run/0]).

run() ->
    L = [1, 2, 3, 10, 4, 5],
    Small = fun(X) -> X < 5 end,
    io:format("~p~n", [lists:takewhile(Small, L)]),
    io:format("~p~n", [lists:dropwhile(Small, L)]),
    io:format("~p~n", [lists:splitwith(Small, L)]),
    io:format("~p~n", [lists:filter(Small, L)]),
    io:format("~p~n", [lists:dropwhile(fun(C) -> C =:= $\s end, "   trim me")]).
