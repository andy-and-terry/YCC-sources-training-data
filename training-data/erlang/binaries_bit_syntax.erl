-module(binaries_bit_syntax).
-export([main/0]).

main() ->
    <<R:8, G:8, B:8>> = <<255, 128, 0>>,
    io:format("~p~n", [{R, G, B}]),
    Bin = <<1:4, 10:4, 65535:16>>,
    io:format("~p ~p~n", [byte_size(Bin), Bin]),
    <<Head:2/binary, Rest/binary>> = <<"hello">>,
    io:format("~p ~p~n", [Head, Rest]),
    io:format("~p~n", [binary_to_list(<<"abc">>)]),
    io:format("~p~n", [list_to_binary([1, 2, 3])]),
    io:format("~p~n", [binary:split(<<"a,b,c">>, <<",">>, [global])]),
    io:format("~s~n", [string:uppercase("shout")]).
