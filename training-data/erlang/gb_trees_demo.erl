-module(gb_trees_demo).
-export([run/0]).

run() ->
    T0 = gb_trees:empty(),
    T1 = gb_trees:insert(bob, 25, T0),
    T2 = gb_trees:insert(alice, 30, T1),
    io:format("~p~n", [gb_trees:lookup(alice, T2)]),
    io:format("~p~n", [gb_trees:lookup(carol, T2)]),
    T3 = gb_trees:update(bob, 26, T2),
    io:format("~p~n", [gb_trees:get(bob, T3)]),
    io:format("~p~n", [gb_trees:size(T3)]),
    io:format("~p~n", [gb_trees:to_list(T3)]).
