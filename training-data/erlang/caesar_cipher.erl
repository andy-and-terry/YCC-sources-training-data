-module(caesar_cipher).
-export([encode/2, run/0]).

encode(Text, K) ->
    [shift(C, K) || C <- Text].

shift(C, K) when C >= $a, C =< $z -> rotate(C, $a, K);
shift(C, K) when C >= $A, C =< $Z -> rotate(C, $A, K);
shift(C, _) -> C.

rotate(C, Base, K) ->
    Base + ((C - Base + K) rem 26 + 26) rem 26.

run() ->
    Enc = encode("Hello, World!", 3),
    io:format("~s~n", [Enc]),
    io:format("~s~n", [encode(Enc, -3)]).
