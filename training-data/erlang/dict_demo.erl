-module(dict_demo).
-export([run/0]).

run() ->
    D0 = dict:new(),
    D1 = dict:store(a, 1, D0),
    D2 = dict:store(b, 2, D1),
    D3 = dict:update_counter(a, 10, D2),
    io:format("~p~n", [dict:fetch(a, D3)]),
    io:format("~p~n", [dict:find(z, D3)]),
    io:format("~p~n", [dict:is_key(b, D3)]),
    io:format("~p~n", [lists:sort(dict:to_list(D3))]),
    D4 = dict:map(fun(_K, V) -> V * 2 end, D3),
    io:format("~p~n", [lists:sort(dict:to_list(D4))]),
    io:format("~p~n", [dict:size(dict:erase(a, D4))]).
