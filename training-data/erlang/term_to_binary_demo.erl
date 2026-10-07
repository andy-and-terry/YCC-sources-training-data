-module(term_to_binary_demo).
-export([run/0]).

run() ->
    Term = #{name => "erlang", tags => [functional, concurrent], version => {27, 0}},
    Bin = term_to_binary(Term),
    io:format("is_binary: ~p~n", [is_binary(Bin)]),
    Back = binary_to_term(Bin),
    io:format("roundtrip equal: ~p~n", [Back =:= Term]),
    io:format("~p~n", [maps:get(version, Back)]),
    Compressed = term_to_binary(lists:duplicate(1000, a), [compressed]),
    Plain = term_to_binary(lists:duplicate(1000, a)),
    io:format("smaller: ~p~n", [byte_size(Compressed) < byte_size(Plain)]),
    io:format("~p~n", [binary_to_term(term_to_binary({ok, [1, 2, 3]}))]),
    io:format("~p~n", [erlang:phash2({a, b}) =:= erlang:phash2({a, b})]),
    io:format("~p~n", [binary:copy(<<"ab">>, 3)]).
