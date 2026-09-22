-module(iolist_demo).
-export([run/0, build_greeting/1, build_report/1]).

%% Erlang idiom: build output as a nested "iolist" (a list whose elements
%% are strings, binaries, integers in 0..255, or further iolists) rather
%% than eagerly concatenating strings or binaries. `io:format`, sockets,
%% and files all accept iolists directly; `erlang:iolist_to_binary/1`
%% flattens one only when an actual binary is needed.

build_greeting(Name) ->
    ["Hello, ", Name, "!"].

build_report(Items) ->
    [io_lib:format("~s: ~p~n", [Key, Value]) || {Key, Value} <- Items].

run() ->
    Greeting = build_greeting("Ada"),
    io:format("~s~n", [Greeting]),
    Report = build_report([{"alice", 30}, {"bob", 25}]),
    io:format("~s", [Report]),
    Binary = erlang:iolist_to_binary(Report),
    io:format("byte size: ~p~n", [byte_size(Binary)]).
