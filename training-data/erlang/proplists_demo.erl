-module(proplists_demo).
-export([run/0]).

run() ->
    Props = [{name, "Alice"}, {age, 30}, admin, {age, 99}],
    io:format("~p~n", [proplists:get_value(name, Props)]),
    io:format("~p~n", [proplists:get_value(age, Props)]),
    io:format("~p~n", [proplists:get_value(missing, Props, undefined)]),
    io:format("~p~n", [proplists:get_bool(admin, Props)]),
    io:format("~p~n", [proplists:get_all_values(age, Props)]),
    io:format("~p~n", [proplists:delete(age, Props)]).
