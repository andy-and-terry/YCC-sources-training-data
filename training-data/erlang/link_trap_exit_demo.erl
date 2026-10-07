-module(link_trap_exit_demo).
-export([run/0, worker/1]).

%% Demonstrates process links with `trap_exit`: when a linked process
%% crashes, a process that is trapping exits receives an
%% `{'EXIT', Pid, Reason}` message instead of also crashing, so it can log
%% the failure (or restart the worker) itself rather than taking the whole
%% supervising process down with it.

worker(crash) ->
    exit(boom);
worker(ok) ->
    receive
        {work, From} -> From ! {result, 42}
    end.

run() ->
    process_flag(trap_exit, true),
    Pid1 = spawn_link(?MODULE, worker, [crash]),
    receive
        {'EXIT', Pid1, Reason} ->
            io:format("worker ~p crashed: ~p~n", [Pid1, Reason])
    end,
    Pid2 = spawn_link(?MODULE, worker, [ok]),
    Pid2 ! {work, self()},
    receive
        {result, Value} ->
            io:format("worker returned: ~p~n", [Value])
    end.
