-module(binary_bit_syntax_parse).
-export([run/0]).

run() ->
    <<A:4, B:4, Rest/binary>> = <<16#AB, 1, 2, 3>>,
    io:format("~p ~p ~p~n", [A, B, Rest]).
