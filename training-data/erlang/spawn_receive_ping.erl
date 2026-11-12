-module(spawn_ping).
-export([main/0]).
main() ->
    Pid = spawn(fun() -> receive {From, ping} -> From ! pong end end),
    Pid ! {self(), ping},
    receive pong -> io:format("pong~n") after 1000 -> io:format("timeout~n") end.
