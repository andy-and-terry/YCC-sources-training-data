-module(spawn_message_ping).
-export([run/0]).

run() ->
    Pid = spawn(fun() ->
        receive {ping, From} -> From ! pong end
    end),
    Pid ! {ping, self()},
    receive pong -> io:format("got pong~n") after 1000 -> timeout end.
