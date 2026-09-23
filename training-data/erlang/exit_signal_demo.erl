-module(exit_signal_demo).
-export([run/0, victim/0]).

%% `exit/2` sends an exit signal to any process, linked or not, which is
%% how a supervisor-like process can terminate a worker it merely
%% monitors. The reason `kill` is special: it cannot be trapped even by
%% a process with `trap_exit` set, unlike an ordinary reason such as
%% `custom_reason` below.

victim() ->
    receive
    after infinity -> ok
    end.

run() ->
    Pid1 = spawn(?MODULE, victim, []),
    Ref1 = erlang:monitor(process, Pid1),
    exit(Pid1, kill),
    receive
        {'DOWN', Ref1, process, Pid1, Reason1} ->
            io:format("untrappable exit: ~p~n", [Reason1])
    end,
    Pid2 = spawn(?MODULE, victim, []),
    Ref2 = erlang:monitor(process, Pid2),
    exit(Pid2, custom_reason),
    receive
        {'DOWN', Ref2, process, Pid2, Reason2} ->
            io:format("ordinary exit: ~p~n", [Reason2])
    end.
