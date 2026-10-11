-module(make_ref_demo).
-export([run/0]).

%% A reference makes a request/response pair unambiguous.
call(Pid, Request) ->
    Ref = make_ref(),
    Pid ! {self(), Ref, Request},
    receive
        {Ref, Reply} -> Reply
    after 1000 -> timeout
    end.

server() ->
    receive
        {From, Ref, {double, N}} ->
            From ! {Ref, N * 2},
            server();
        stop -> ok
    end.

run() ->
    Pid = spawn(fun server/0),
    io:format("~p~n", [call(Pid, {double, 21})]),
    io:format("~p~n", [call(Pid, {double, 4})]),
    Pid ! stop,
    io:format("~p~n", [make_ref() =:= make_ref()]).
