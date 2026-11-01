-module(try_catch_after_ex).
-export([main/0]).

safe(F) ->
    try F() of
        V -> {ok, V}
    catch
        error:badarith -> {error, arith};
        throw:Reason -> {thrown, Reason}
    after
        io:format("done~n")
    end.

main() ->
    io:format("~p~n", [safe(fun() -> 1 / 0 end)]),
    io:format("~p~n", [safe(fun() -> throw(oops) end)]).
