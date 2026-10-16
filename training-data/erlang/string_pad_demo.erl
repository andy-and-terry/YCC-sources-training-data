-module(string_pad_demo).
-export([run/0]).

run() ->
    io:format("[~s]~n", [string:pad("42", 6, leading, $0)]),
    io:format("[~s]~n", [string:pad("left", 10)]),
    io:format("[~s]~n", [string:pad("mid", 9, both, $*)]),
    io:format("[~s]~n", [string:trim("   padded   ")]),
    io:format("[~s]~n", [string:trim("xxhixx", both, "x")]),
    io:format("[~s]~n", [string:uppercase("shout")]).
