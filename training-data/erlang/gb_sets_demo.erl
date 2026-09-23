-module(gb_sets_demo).
-export([run/0]).

run() ->
    S0 = gb_sets:empty(),
    S1 = gb_sets:add(5, S0),
    S2 = gb_sets:add(2, S1),
    S3 = gb_sets:add(8, S2),
    S4 = gb_sets:add(2, S3),
    io:format("~p~n", [gb_sets:to_list(S4)]),
    io:format("~p~n", [gb_sets:is_member(8, S4)]),
    io:format("~p~n", [gb_sets:is_member(3, S4)]),
    io:format("~p~n", [gb_sets:size(S4)]),
    S5 = gb_sets:delete(2, S4),
    io:format("~p~n", [gb_sets:to_list(S5)]).
