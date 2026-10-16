-module(bit_syntax_rgb_demo).
-export([run/0, pack/3, unpack/1]).

%% Pack three 5/6/5 bit colour channels into a 16-bit value.
pack(R, G, B) -> <<R:5, G:6, B:5>>.

unpack(<<R:5, G:6, B:5>>) -> {R, G, B}.

run() ->
    Packed = pack(31, 0, 15),
    io:format("~p~n", [Packed]),
    io:format("~p~n", [unpack(Packed)]),
    <<High:4, Low:4>> = <<16#A7>>,
    io:format("~.16B ~.16B~n", [High, Low]),
    <<N:16/little>> = <<1, 2>>,
    io:format("~p~n", [N]),
    <<M:16/big>> = <<1, 2>>,
    io:format("~p~n", [M]).
