-module(try_catch_after_demo).
-export([run/0]).

safe_div(A, B) ->
    try A div B of
        R -> {ok, R}
    catch
        error:badarith -> {error, div_by_zero}
    after
        io:format("done ~p/~p~n", [A, B])
    end.

run() ->
    io:format("~p~n", [safe_div(10, 2)]),
    io:format("~p~n", [safe_div(1, 0)]),
    R = try throw(oops) catch throw:V -> {caught, V} end,
    io:format("~p~n", [R]).
