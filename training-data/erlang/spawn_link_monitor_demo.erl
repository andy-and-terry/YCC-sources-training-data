-module(spawn_link_monitor_demo).
-export([run/0]).

run() ->
    {Pid, Ref} = spawn_monitor(fun() -> exit(normal) end),
    receive
        {'DOWN', Ref, process, Pid, Reason} ->
            io:format("down: ~p~n", [Reason])
    after 1000 -> timeout
    end,
    Parent = self(),
    spawn(fun() -> Parent ! {self(), hello} end),
    receive
        {_, Msg} -> io:format("~p~n", [Msg])
    after 1000 -> timeout
    end.
