-module(binary_part_demo).
-export([run/0]).

run() ->
    B = <<"abcdefghij">>,
    io:format("~p~n", [binary:part(B, 2, 4)]),
    io:format("~p~n", [binary:part(B, {7, 3})]),
    io:format("~p~n", [binary:first(B)]),
    io:format("~p~n", [binary:last(B)]),
    io:format("~p~n", [binary:at(B, 3)]),
    io:format("~p~n", [binary:copy(<<"ab">>, 3)]),
    io:format("~p~n", [binary:bin_to_list(B, 1, 3)]).
