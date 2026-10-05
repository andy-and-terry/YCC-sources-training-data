-module(io_lib_format_demo).
-export([run/0]).

run() ->
    S1 = io_lib:format("~5.2f|~-8s|~8s|", [3.14159, "left", "right"]),
    io:format("~s~n", [S1]),
    io:format("~p ~w ~s~n", ["str", "str", "str"]),
    io:format("~e~n", [12345.678]),
    io:format("~.16B ~.2B ~c~n", [255, 5, $A]),
    io:format("~*.*.0f~n", [8, 2, 2.5]),
    Flat = lists:flatten(io_lib:format("~p-~p", [1, 2])),
    io:format("~s ~p~n", [Flat, length(Flat)]),
    io:format("~~ tilde and ~n newline~n").
