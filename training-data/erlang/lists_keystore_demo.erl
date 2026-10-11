-module(lists_keystore_demo).
-export([run/0]).

run() ->
    L0 = [{a, 1}, {b, 2}],
    L1 = lists:keystore(c, 1, L0, {c, 3}),
    L2 = lists:keystore(a, 1, L1, {a, 100}),
    io:format("~p~n", [L2]),
    io:format("~p~n", [lists:keydelete(b, 1, L2)]),
    io:format("~p~n", [lists:keyreplace(c, 1, L2, {c, 33})]),
    io:format("~p~n", [lists:keytake(a, 1, L2)]),
    io:format("~p~n", [lists:keymember(z, 1, L2)]).
