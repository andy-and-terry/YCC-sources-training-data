-module(observer_pattern).
-export([run/0, subject_loop/1, observer_loop/1]).

%% The Gang-of-Four Observer pattern falls out naturally from Erlang's
%% actor model: the subject process keeps a list of subscriber pids and
%% `!`-sends each of them a message whenever its state changes.

subject_loop(Observers) ->
    receive
        {subscribe, Pid} ->
            subject_loop([Pid | Observers]);
        {notify, Event} ->
            lists:foreach(fun(Pid) -> Pid ! {event, Event} end, Observers),
            subject_loop(Observers);
        stop ->
            ok
    end.

observer_loop(Name) ->
    receive
        {event, Event} ->
            io:format("~p received event: ~p~n", [Name, Event]),
            observer_loop(Name);
        stop ->
            ok
    end.

run() ->
    Subject = spawn(?MODULE, subject_loop, [[]]),
    ObserverA = spawn(?MODULE, observer_loop, [observer_a]),
    ObserverB = spawn(?MODULE, observer_loop, [observer_b]),
    Subject ! {subscribe, ObserverA},
    Subject ! {subscribe, ObserverB},
    Subject ! {notify, temperature_changed},
    timer:sleep(50),
    Subject ! stop,
    ObserverA ! stop,
    ObserverB ! stop.
