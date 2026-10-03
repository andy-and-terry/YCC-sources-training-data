-module(link_trap_exit_demo).
-export([run/0, worker/1]).

%% Unlike erlang:monitor/2 (one-way, always delivers a 'DOWN' message),
%% spawn_link/3 creates a bidirectional link: by default either side's
%% crash kills the other too. Trapping exits turns that crash into an
%% ordinary {'EXIT', Pid, Reason} message instead, which is how
%% supervisors implement fault isolation without OTP's supervisor module.

worker(Behavior) ->
    receive
        stop -> ok;
        crash -> exit(Behavior)
    end.

run() ->
    process_flag(trap_exit, true),
    Pid = spawn_link(?MODULE, worker, [boom]),
    Pid ! crash,
    receive
        {'EXIT', Pid, Reason} ->
            io:format("linked worker exited: ~p~n", [Reason])
    end.
