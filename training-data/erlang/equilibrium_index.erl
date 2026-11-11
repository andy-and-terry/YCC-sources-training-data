-module(equilibrium_index).
-export([run/0, find/1]).

find(Nums) ->
    Total = lists:sum(Nums),
    go(Nums, 0, 0, Total).

go([], _I, _Left, _Total) -> -1;
go([V | _], I, Left, Total) when Left =:= Total - Left - V -> I;
go([V | Rest], I, Left, Total) -> go(Rest, I + 1, Left + V, Total).

run() ->
    io:format("~p~n", [find([1, 7, 3, 6, 5, 6])]),
    io:format("~p~n", [find([1, 2, 3])]).
