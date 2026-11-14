-module(spawn_link_message_ring).
-export([main/0]).

main() ->
    Self = self(),
    Pid = spawn(fun() -> receive {ping, From} -> From ! pong end end),
    Pid ! {ping, Self},
    receive pong -> io:format("got pong~n") after 1000 -> io:format("timeout~n") end.
