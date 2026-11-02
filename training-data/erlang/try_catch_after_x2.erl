-module(try_catch_after_x2).
-export([safe/1]).

safe(F) ->
    try F() of
        V -> {ok, V}
    catch
        error:Reason -> {error, Reason}
    after
        io:format("done~n")
    end.
