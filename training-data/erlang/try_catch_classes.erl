-module(try_catch_classes).
-export([safe/1]).

safe(F) ->
    try F() of
        V -> {ok, V}
    catch
        error:Reason -> {error, Reason};
        throw:Thing -> {thrown, Thing};
        exit:Why -> {exit, Why}
    end.
