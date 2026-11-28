-module(try_catch_classes).
-export([main/0]).

safe(F) ->
    try F() of V -> {ok, V}
    catch error:badarith -> {error, arith};
          throw:T -> {thrown, T};
          exit:R -> {exit, R}
    end.

main() ->
    io:format("~p~n", [[safe(fun() -> 1 / 0 end), safe(fun() -> throw(x) end), safe(fun() -> 7 end)]]).
