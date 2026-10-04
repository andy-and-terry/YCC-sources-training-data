-module(io_lib_format_demo).
-export([main/0]).

main() ->
    io:format("~s~n", ["plain string"]),
    io:format("~p~n", [{ok, [1, 2, 3], "text"}]),
    io:format("~w~n", ["abc"]),
    io:format("~10.3f|~n", [3.14159]),
    io:format("~e~n", [12345.678]),
    io:format("~8.2.0f~n", [2.5]),
    io:format("~-8s|~8s|~n", ["left", "right"]),
    io:format("~8..0B~n", [42]),
    io:format("~.16B ~.2B~n", [255, 5]),
    io:format("~c~c~n", [$o, $k]),
    io:format("~~ literal tilde~n"),
    Flat = lists:flatten(io_lib:format("~p-~p", [a, b])),
    io:format("~s (~p chars)~n", [Flat, length(Flat)]),
    io:format("~ts~n", [[1087, 1088, 1080]]).
