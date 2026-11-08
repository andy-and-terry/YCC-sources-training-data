-module(rot47_cipher).
-export([main/0]).

rot(C) when C >= 33, C =< 126 -> 33 + (C - 33 + 47) rem 94;
rot(C) -> C.

rot47(S) -> lists:map(fun rot/1, S).

main() ->
    E = rot47("Hello, World!"),
    io:format("~s~n~s~n", [E, rot47(E)]).
