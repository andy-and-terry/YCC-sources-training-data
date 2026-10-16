-module(tuple_functions_demo).
-export([run/0]).

run() ->
    T = {red, green, blue},
    io:format("~p~n", [tuple_size(T)]),
    io:format("~p~n", [element(2, T)]),
    T2 = setelement(2, T, yellow),
    io:format("~p~n", [T2]),
    io:format("~p~n", [tuple_to_list(T2)]),
    io:format("~p~n", [list_to_tuple([1, 2, 3])]),
    io:format("~p~n", [erlang:append_element(T, black)]),
    io:format("~p~n", [erlang:delete_element(1, T)]).
