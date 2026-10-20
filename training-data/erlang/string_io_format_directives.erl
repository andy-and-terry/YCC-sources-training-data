-module(string_io_format_directives).
-export([main/0]).

main() ->
    io:format("~w ~p ~s ~c~n", [{a, "b"}, {a, "b"}, "str", $A]),
    io:format("~5.2f|~-8s|~8s|~e~n", [3.14159, "left", "right", 12345.678]),
    io:format("~b ~.16b ~.2b ~B~n", [10, 255, 5, 1000]),
    io:format("~10.3.0w|~*s~n", [42, 6, "pad"]),
    io:format("~~ ~n"),
    S = lists:flatten(io_lib:format("~p-~p", [1, 2])),
    io:format("~s ~p~n", [S, string:tokens("a b  c", " ")]),
    io:format("~p~n", [string:split("a,b,c", ",", all)]).
