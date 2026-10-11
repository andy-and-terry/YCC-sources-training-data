-module(binary_match_demo).
-export([run/0]).

run() ->
    Bin = <<"the quick brown fox">>,
    io:format("~p~n", [binary:match(Bin, <<"quick">>)]),
    io:format("~p~n", [binary:match(Bin, <<"cat">>)]),
    io:format("~p~n", [binary:matches(<<"abcabcab">>, <<"ab">>)]),
    io:format("~p~n", [binary:split(Bin, <<" ">>, [global])]),
    io:format("~p~n", [binary:replace(Bin, <<"quick">>, <<"slow">>)]).
