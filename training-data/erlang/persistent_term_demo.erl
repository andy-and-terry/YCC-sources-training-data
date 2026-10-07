-module(persistent_term_demo).
-export([run/0]).

run() ->
    persistent_term:put({?MODULE, config}, #{mode => fast, retries => 3}),
    Cfg = persistent_term:get({?MODULE, config}),
    io:format("~p~n", [maps:get(retries, Cfg)]),
    io:format("~p~n", [persistent_term:get({?MODULE, missing}, default)]),
    true = persistent_term:erase({?MODULE, config}),
    io:format("~p~n", [persistent_term:get({?MODULE, config}, gone)]).
