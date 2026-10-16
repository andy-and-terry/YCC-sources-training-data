-module(string_to_integer_demo).
-export([run/0, parse/1]).

parse(S) ->
    case string:to_integer(S) of
        {error, _} -> invalid;
        {N, ""} -> {ok, N};
        {N, Rest} -> {partial, N, Rest}
    end.

run() ->
    io:format("~p~n", [parse("123")]),
    io:format("~p~n", [parse("-45")]),
    io:format("~p~n", [parse("12abc")]),
    io:format("~p~n", [parse("abc")]),
    io:format("~p~n", [list_to_integer("ff", 16)]),
    io:format("~p~n", [integer_to_list(255, 2)]).
