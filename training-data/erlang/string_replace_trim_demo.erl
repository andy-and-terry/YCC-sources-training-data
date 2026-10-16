-module(string_replace_trim_demo).
-export([run/0]).

run() ->
    io:format("~s~n", [string:replace("a-b-c", "-", "+")]),
    io:format("~s~n", [lists:flatten(string:replace("a-b-c", "-", "+", all))]),
    io:format("~p~n", [string:find("hello world", "wor")]),
    io:format("~p~n", [string:prefix("foobar", "foo")]),
    io:format("~p~n", [string:length("naive")]),
    io:format("~s~n", [string:slice("abcdefgh", 2, 3)]),
    io:format("~p~n", [string:equal("ABC", "abc", true)]).
