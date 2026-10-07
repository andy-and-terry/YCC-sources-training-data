-module(io_lib_format_demo).
-export([run/0]).

run() ->
    Str = lists:flatten(io_lib:format("~s has ~B items costing ~.2f", ["cart", 3, 9.5])),
    io:format("~s~n", [Str]),
    io:format("~10s|~-10s|~n", ["right", "left"]),
    io:format("~p ~w~n", ["text", "text"]),
    io:format("~.16B ~.2B~n", [255, 5]),
    io:format("~e~n", [12345.678]),
    io:format("~c~c~n", [$o, $k]).
