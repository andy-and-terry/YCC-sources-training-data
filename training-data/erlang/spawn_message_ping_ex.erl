-module(spawn_message_ping_ex).
-export([main/0]).

pong() ->
    receive
        {From, ping} -> From ! pong, pong();
        stop -> ok
    end.

main() ->
    P = spawn(fun pong/0),
    P ! {self(), ping},
    receive pong -> io:format("got pong~n") after 1000 -> timeout end,
    P ! stop.
