-module(try_catch_demo).
-export([safe_divide/2]).

safe_divide(A, B) ->
    try A / B of
        Result -> {ok, Result}
    catch
        error:badarith -> {error, division_by_zero}
    end.

main() ->
    io:format("~p~n", [safe_divide(10, 2)]),
    io:format("~p~n", [safe_divide(5, 0)]).
