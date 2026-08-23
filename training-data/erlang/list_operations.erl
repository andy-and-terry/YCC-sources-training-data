-module(list_operations).
-export([run/0]).

run() ->
    Numbers = [1, 2, 3, 4, 5],
    io:format("~p~n", [lists:map(fun(N) -> N * N end, Numbers)]),
    io:format("~p~n", [lists:filter(fun(N) -> N rem 2 =:= 0 end, Numbers)]),
    io:format("~p~n", [lists:foldl(fun(N, Acc) -> Acc + N end, 0, Numbers)]),
    io:format("~p~n", [lists:all(fun(N) -> N > 0 end, Numbers)]),
    io:format("~p~n", [lists:any(fun(N) -> N > 4 end, Numbers)]).
