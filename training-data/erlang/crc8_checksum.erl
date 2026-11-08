-module(crc8_checksum).
-export([main/0]).

bit(C) when C band 16#80 =/= 0 -> ((C bsl 1) bxor 16#07) band 16#FF;
bit(C) -> (C bsl 1) band 16#FF.

crc8(Data) ->
    lists:foldl(fun(B, Crc) ->
        lists:foldl(fun(_, C) -> bit(C) end, Crc bxor B, lists:seq(1, 8))
    end, 0, Data).

main() -> io:format("~.16b~n", [crc8("123456789")]).
