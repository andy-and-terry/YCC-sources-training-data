-module(sets_demo).
-export([run/0]).

run() ->
    A = sets:from_list([1, 2, 3, 4]),
    B = sets:from_list([3, 4, 5]),
    io:format("~p~n", [lists:sort(sets:to_list(sets:union(A, B)))]),
    io:format("~p~n", [lists:sort(sets:to_list(sets:intersection(A, B)))]),
    io:format("~p~n", [lists:sort(sets:to_list(sets:subtract(A, B)))]),
    io:format("~p~n", [sets:is_element(2, A)]),
    io:format("~p~n", [sets:is_subset(sets:from_list([1, 2]), A)]).
