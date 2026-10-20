-module(try_catch_exceptions).
-export([main/0]).

safe_div(A, B) ->
    try A div B of
        R -> {ok, R}
    catch
        error:badarith -> {error, div_by_zero}
    after
        io:format("div attempted~n")
    end.

main() ->
    io:format("~p ~p~n", [safe_div(10, 2), safe_div(1, 0)]),
    R = (catch throw(oops)),
    io:format("~p~n", [R]),
    try exit(normal) catch exit:Reason -> io:format("exit ~p~n", [Reason]) end,
    try error(custom) catch Class:Err -> io:format("~p ~p~n", [Class, Err]) end.
