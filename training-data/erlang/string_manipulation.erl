-module(string_manipulation).
-export([run/0]).

run() ->
    Str = "Hello, Erlang World!",
    io:format("~s~n", [string:uppercase(Str)]),
    io:format("~s~n", [string:lowercase(Str)]),
    io:format("~p~n", [length(Str)]),
    io:format("~p~n", [string:tokens(Str, " ")]),
    io:format("~p~n", [string:prefix(Str, "Hello")]).
