-module(lists_join_demo).
-export([main/0]).

main() ->
    io:format("~p~n", [lists:join(", ", ["a", "b", "c"])]),
    io:format("~s~n", [lists:flatten(lists:join("-", ["2024", "01", "15"]))]),
    io:format("~p~n", [lists:join(0, [1, 2, 3])]),
    io:format("~p~n", [lists:join(x, [])]),
    io:format("~s~n", [string:join(["x", "y"], "+")]).
