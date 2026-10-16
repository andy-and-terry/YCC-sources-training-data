-module(bin_to_hex).
-export([run/0, to_hex/1, from_hex/1]).

to_hex(Bin) -> << <<(hex(N div 16)), (hex(N rem 16))>> || <<N>> <= Bin >>.

hex(N) when N < 10 -> $0 + N;
hex(N) -> $a + N - 10.

from_hex(Hex) -> << <<(list_to_integer([A, B], 16))>> || <<A, B>> <= Hex >>.

run() ->
    H = to_hex(<<"Erlang">>),
    io:format("~s~n", [H]),
    io:format("~s~n", [from_hex(H)]),
    io:format("~s~n", [to_hex(<<0, 255, 16>>)]).
