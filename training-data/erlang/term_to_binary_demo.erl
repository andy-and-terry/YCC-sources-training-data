-module(term_to_binary_demo).
-export([run/0]).

run() ->
    Term = {user, "ann", [1, 2, 3], #{role => admin}},
    Bin = term_to_binary(Term),
    io:format("is_binary: ~p~n", [is_binary(Bin)]),
    io:format("roundtrip ok: ~p~n", [binary_to_term(Bin) =:= Term]),
    Compressed = term_to_binary(lists:seq(1, 1000), [compressed]),
    Plain = term_to_binary(lists:seq(1, 1000)),
    io:format("compressed smaller: ~p~n", [byte_size(Compressed) < byte_size(Plain)]),
    io:format("~p~n", [binary_to_term(term_to_binary(<<"bits">>))]),
    io:format("~p~n", [erlang:phash2({a, b})]),
    io:format("~p~n", [erlang:md5(<<"hello">>) =:= erlang:md5(<<"hello">>)]).
