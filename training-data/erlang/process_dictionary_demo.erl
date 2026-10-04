-module(process_dictionary_demo).
-export([run/0]).

run() ->
    undefined = put(counter, 0),
    increment(),
    increment(),
    increment(),
    io:format("counter: ~p~n", [get(counter)]),
    put(name, <<"worker">>),
    io:format("keys: ~p~n", [lists:sort(get_keys())]),
    io:format("missing: ~p~n", [get(nothing)]),
    io:format("erased: ~p~n", [erase(name)]),
    io:format("all: ~p~n", [get()]),
    Parent = self(),
    spawn(fun() -> Parent ! {child_sees, get(counter)} end),
    receive
        {child_sees, V} -> io:format("child sees: ~p~n", [V])
    after 1000 -> timeout
    end.

increment() ->
    put(counter, get(counter) + 1).
