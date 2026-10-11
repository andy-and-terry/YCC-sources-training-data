-module(base64_demo).
-export([run/0]).

run() ->
    Enc = base64:encode("Hello, Erlang!"),
    io:format("~s~n", [Enc]),
    Dec = base64:decode(Enc),
    io:format("~s~n", [Dec]),
    io:format("~s~n", [base64:encode(<<1, 2, 3, 4>>)]),
    io:format("~p~n", [base64:decode_to_string("SGk=")]).
