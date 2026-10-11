-module(atom_conversion_demo).
-export([run/0]).

run() ->
    A = list_to_atom("hello"),
    io:format("~p~n", [A]),
    io:format("~p~n", [atom_to_list(world)]),
    io:format("~p~n", [atom_to_binary(erlang, utf8)]),
    io:format("~p~n", [binary_to_atom(<<"abc">>, utf8)]),
    io:format("~p~n", [list_to_existing_atom("hello")]),
    io:format("~p~n", [is_atom('Quoted Atom')]),
    io:format("~p~n", ['Quoted Atom']).
