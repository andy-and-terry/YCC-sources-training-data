-module(integer_conversion_demo).
-export([run/0]).

run() ->
    io:format("~p~n", [list_to_integer("1234")]),
    io:format("~p~n", [integer_to_list(255, 16)]),
    io:format("~p~n", [list_to_integer("ff", 16)]),
    io:format("~p~n", [integer_to_binary(42)]),
    io:format("~p~n", [binary_to_integer(<<"-17">>)]),
    io:format("~p~n", [list_to_float("2.5")]),
    io:format("~p~n", [float_to_list(3.14159, [{decimals, 2}])]),
    io:format("~p~n", [atom_to_list(hello)]),
    io:format("~p~n", [list_to_atom("world")]),
    io:format("~p~n", [binary_to_list(<<1, 2, 3>>)]),
    io:format("~p~n", [list_to_binary([104, 105])]),
    io:format("~p~n", [float(7)]),
    io:format("~p~n", [(catch list_to_integer("abc"))]).
