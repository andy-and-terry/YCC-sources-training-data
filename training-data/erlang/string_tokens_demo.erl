-module(string_tokens_demo).
-export([run/0]).

run() ->
    io:format("~p~n", [string:tokens("a,b;;c d", ",; ")]),
    io:format("~p~n", [string:split("one,two,three", ",", all)]),
    io:format("~p~n", [string:trim("  padded  ")]),
    io:format("~p~n", [string:uppercase("erlang")]),
    io:format("~p~n", [string:length("héllo")]),
    io:format("~p~n", [string:find("hello world", "wor")]),
    io:format("~p~n", [string:replace("a-b-c", "-", "+", all)]),
    io:format("~p~n", [lists:join("/", ["x", "y", "z"])]),
    io:format("~p~n", [string:slice("abcdef", 1, 3)]),
    io:format("~p~n", [lists:reverse("stressed")]).
