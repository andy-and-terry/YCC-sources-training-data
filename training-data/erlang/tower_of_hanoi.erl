-module(tower_of_hanoi).
-export([moves/4]).

moves(0, _From, _To, _Via) -> [];
moves(N, From, To, Via) ->
    moves(N - 1, From, Via, To) ++ [{From, To}] ++ moves(N - 1, Via, To, From).

run() ->
    io:format("~p~n", [moves(3, left, right, middle)]).
