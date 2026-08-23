-module(spawn_message_demo).
-export([run/0, loop/0]).

loop() ->
    receive
        {From, ping} ->
            From ! pong,
            loop();
        stop ->
            ok
    end.

run() ->
    Pid = spawn(?MODULE, loop, []),
    Pid ! {self(), ping},
    receive
        pong -> io:format("received pong~n")
    end,
    Pid ! stop.
