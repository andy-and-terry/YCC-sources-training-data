-module(process_dictionary_demo).
-export([run/0]).

run() ->
    undefined = put(counter, 0),
    lists:foreach(fun(_) -> put(counter, get(counter) + 1) end, lists:seq(1, 5)),
    io:format("~p~n", [get(counter)]),
    put(name, "worker"),
    io:format("~p~n", [lists:sort(get())]),
    io:format("~p~n", [erase(name)]),
    io:format("~p~n", [get(name)]).
