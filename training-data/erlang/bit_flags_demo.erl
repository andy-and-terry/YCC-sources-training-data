-module(bit_flags_demo).
-export([run/0, parse/1, build/3]).

%% Pack three fields into one byte: 1 flag bit, 3-bit type, 4-bit length.
build(Flag, Type, Len) ->
    <<Flag:1, Type:3, Len:4>>.

parse(<<Flag:1, Type:3, Len:4>>) ->
    #{flag => Flag, type => Type, len => Len}.

run() ->
    B = build(1, 5, 9),
    io:format("~p~n", [B]),
    io:format("~p~n", [parse(B)]),
    io:format("~.2B~n", [binary:decode_unsigned(B)]),
    X = 16#B4,
    io:format("~p ~p ~p ~p~n", [X band 16#0F, X bor 1, X bxor 16#FF, X bsr 4]),
    io:format("~p~n", [1 bsl 10]),
    io:format("~p~n", [bnot 0]).
