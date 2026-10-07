-module(list_rotation).
-export([rotate_left/2, rotate_right/2, run/0]).

rotate_left(_N, []) -> [];
rotate_left(N, List) ->
    K = N rem length(List),
    K1 = if K < 0 -> K + length(List); true -> K end,
    {Front, Back} = lists:split(K1, List),
    Back ++ Front.

rotate_right(N, List) -> rotate_left(-N, List).

run() ->
    L = [1, 2, 3, 4, 5],
    io:format("~p~n", [rotate_left(2, L)]),
    io:format("~p~n", [rotate_right(2, L)]),
    io:format("~p~n", [rotate_left(7, L)]),
    io:format("~p~n", [rotate_left(-1, L)]).
