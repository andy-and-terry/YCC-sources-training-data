-module(spawn_receive_ping_x2).
-export([run/0]).

run() ->
    Pid = spawn(fun() -> receive {From, ping} -> From ! pong end end),
    Pid ! {self(), ping},
    receive pong -> ok after 1000 -> timeout end.
