-module(float_to_list_demo).
-export([run/0]).

run() ->
    io:format("~s~n", [float_to_list(3.14159, [{decimals, 2}])]),
    io:format("~s~n", [float_to_list(2.5, [{decimals, 0}])]),
    io:format("~s~n", [float_to_list(1.0e10, [{scientific, 3}])]),
    io:format("~p~n", [list_to_float("2.75")]),
    io:format("~p~n", [round(2.5)]),
    io:format("~p~n", [trunc(-2.7)]),
    io:format("~p~n", [ceil(2.1)]),
    io:format("~p~n", [floor(-2.1)]).
