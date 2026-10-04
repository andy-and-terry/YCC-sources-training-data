-module(string_tokens_demo).
-export([run/0]).

run() ->
    io:format("~p~n", [string:tokens("a,b,,c", ",")]),
    io:format("~p~n", [string:split("a,b,,c", ",", all)]),
    io:format("~p~n", [string:split("key=value=more", "=")]),
    io:format("~p~n", [string:trim("  padded  ")]),
    io:format("~p~n", [string:uppercase("shout")]),
    io:format("~p~n", [string:length("héllo")]),
    io:format("~p~n", [string:slice("abcdefgh", 2, 3)]),
    io:format("~p~n", [string:find("hello world", "world")]),
    io:format("~p~n", [string:replace("one two two", "two", "2", all)]),
    io:format("~p~n", [string:join(["x", "y", "z"], "-")]),
    io:format("~p~n", [string:equal("ABC", "abc", true)]),
    io:format("~s~n", [lists:flatten(string:pad("pad", 8, trailing, $.))]).
