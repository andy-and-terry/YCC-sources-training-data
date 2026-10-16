-module(lists_splitwith_takewhile_demo).
-export([run/0]).

run() ->
    L = [2, 4, 6, 7, 8, 10],
    Even = fun(X) -> X rem 2 =:= 0 end,
    io:format("~p~n", [lists:takewhile(Even, L)]),
    io:format("~p~n", [lists:dropwhile(Even, L)]),
    io:format("~p~n", [lists:splitwith(Even, L)]),
    io:format("~p~n", [lists:partition(Even, L)]).
