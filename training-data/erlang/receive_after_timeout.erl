-module(receive_after_timeout).
-export([wait/1]).

wait(Ms) ->
    receive
        {msg, M} -> {got, M}
    after Ms -> timeout
    end.
