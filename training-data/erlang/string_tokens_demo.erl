-module(string_tokens_demo).
-export([run/0]).

run() ->
    io:format("~p~n", [string:tokens("a,b,,c", ",")]),
    io:format("~p~n", [string:split("a,b,,c", ",", all)]),
    io:format("~p~n", [string:split("key=value=x", "=")]),
    io:format("~p~n", [string:trim("  padded  ")]),
    io:format("~p~n", [string:uppercase("hello")]),
    io:format("~p~n", [string:join(["x", "y", "z"], "-")]),
    io:format("~p~n", [string:find("hello world", "wor")]),
    io:format("~p~n", [string:slice("abcdefgh", 2, 3)]),
    io:format("~p~n", [string:length("héllo")]),
    io:format("~p~n", [string:str("banana", "nan")]).
