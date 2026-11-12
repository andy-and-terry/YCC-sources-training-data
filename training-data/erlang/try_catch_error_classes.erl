-module(try_classes).
-export([main/0]).
t(F) ->
    try F() of V -> {ok, V}
    catch error:R -> {error, R}; throw:T -> {thrown, T}; exit:E -> {exit, E}
    end.
main() ->
    io:format("~p~n", [[t(fun() -> 1 div 0 end), t(fun() -> throw(oops) end), t(fun() -> exit(bye) end), t(fun() -> 7 end)]]).
