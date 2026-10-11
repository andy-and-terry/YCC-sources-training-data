-module(receive_flush_demo).
-export([run/0]).

flush() ->
    receive
        Msg -> [Msg | flush()]
    after 0 ->
        []
    end.

run() ->
    Self = self(),
    Self ! one,
    Self ! two,
    Self ! three,
    io:format("~p~n", [flush()]),
    io:format("~p~n", [flush()]).
