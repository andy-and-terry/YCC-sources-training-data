-module(io_lib_format_demo).
-export([run/0]).

run() ->
    io:format("~10s|~-10s|~n", ["right", "left"]),
    io:format("~5.2f ~e ~g~n", [3.14159, 12345.678, 0.5]),
    io:format("~p~n", [[{a, 1}, {b, 2}]]),
    io:format("~w ~s ~c~n", ["str", "str", $x]),
    io:format("~.16B ~.2B ~8.2.0B~n", [255, 5, 7]),
    io:format("~*.*f~n", [8, 2, 2.5]),
    S = lists:flatten(io_lib:format("~p-~p", [1, two])),
    io:format("~s ~p~n", [S, length(S)]),
    io:format("~~ literal tilde, ~n"),
    io:format("~ts~n", [[1087, 1088, 1080]]).
