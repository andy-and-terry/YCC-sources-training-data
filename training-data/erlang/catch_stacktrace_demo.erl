-module(catch_stacktrace_demo).
-export([run/0]).

boom() -> erlang:error(custom_failure).

run() ->
    try boom()
    catch
        error:Reason:Stack ->
            io:format("reason: ~p~n", [Reason]),
            [{M, F, A, _} | _] = Stack,
            io:format("top frame: ~p:~p/~p~n", [M, F, A])
    end,
    R = (catch 1 div 0),
    io:format("~p~n", [element(1, R)]),
    try throw(early_exit) catch throw:T -> io:format("caught ~p~n", [T]) end.
