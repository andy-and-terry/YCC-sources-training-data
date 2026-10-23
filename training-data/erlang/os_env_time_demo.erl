-module(os_env_time_demo).
-export([run/0]).

run() ->
    os:putenv("DEMO_VAR", "hello"),
    io:format("~p~n", [os:getenv("DEMO_VAR")]),
    io:format("~p~n", [os:getenv("DEMO_MISSING_VAR")]),
    io:format("~p~n", [os:getenv("DEMO_MISSING_VAR", "default")]),
    io:format("~p~n", [element(1, os:type())]),
    {Mega, Sec, _} = os:timestamp(),
    io:format("~p~n", [Mega * 1000000 + Sec > 0]),
    io:format("~p~n", [is_integer(erlang:system_time(second))]).
