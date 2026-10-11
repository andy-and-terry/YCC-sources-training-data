-module(try_after_demo).
-export([run/0]).

risky(0) -> error(zero);
risky(N) -> 100 div N.

attempt(N) ->
    try risky(N) of
        V -> {ok, V}
    catch
        error:zero -> {error, zero};
        Class:Reason -> {Class, Reason}
    after
        io:format("cleanup for ~p~n", [N])
    end.

run() ->
    io:format("~p~n", [attempt(5)]),
    io:format("~p~n", [attempt(0)]),
    io:format("~p~n", [attempt(foo)]).
