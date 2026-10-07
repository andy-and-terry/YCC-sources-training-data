-module(string_module_demo).
-export([run/0]).

run() ->
    io:format("~p~n", [string:split("a,b,c", ",", all)]),
    io:format("~p~n", [string:trim("  padded  ")]),
    io:format("~p~n", [string:uppercase("hello")]),
    io:format("~p~n", [string:lexemes("one two  three", " ")]),
    io:format("~p~n", [string:find("hello world", "world")]),
    io:format("~p~n", [string:length("héllo")]),
    io:format("~p~n", [string:replace("a-b-c", "-", "+", all)]).
