-module(io_lib_format_demo).
-export([run/0]).

run() ->
    Line = io_lib:format("~s has ~B items costing ~.2f", ["cart", 3, 9.5]),
    io:format("~s~n", [Line]),
    io:format("[~10s]~n", ["right"]),
    io:format("[~-10s]~n", ["left"]),
    io:format("[~10.3.0f]~n", [3.14159]),
    io:format("~w ~p~n", ["str", "str"]),
    io:format("~c~c~n", [$o, $k]),
    io:format("~e~n", [12345.678]),
    io:format("~.16B~n", [255]),
    io:format("~.2B~n", [10]),
    io:format("~~ tilde~n"),
    io:format("~p~n", [lists:flatten(io_lib:format("~p-~p", [a, b]))]),
    io:format("~ts~n", [[955, 120]]).
