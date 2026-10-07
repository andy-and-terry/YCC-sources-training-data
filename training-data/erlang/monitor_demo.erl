-module(monitor_demo).
-export([run/0, worker/0]).

worker() ->
    receive
        stop -> ok;
        crash -> exit(boom)
    end.

run() ->
    Pid = spawn(?MODULE, worker, []),
    Ref = erlang:monitor(process, Pid),
    Pid ! stop,
    receive
        {'DOWN', Ref, process, Pid, Reason} ->
            io:format("worker exited: ~p~n", [Reason])
    end.
