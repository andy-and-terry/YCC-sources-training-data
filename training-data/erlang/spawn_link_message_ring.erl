-module(spawn_link_message_ring).
-export([run/0]).

run() ->
    Self = self(),
    Pid = spawn(fun() ->
        receive {From, N} -> From ! {reply, N * 2} end
    end),
    Pid ! {Self, 21},
    receive {reply, V} -> io:format("~p~n", [V]) after 1000 -> timeout end.
