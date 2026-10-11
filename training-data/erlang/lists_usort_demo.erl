-module(lists_usort_demo).
-export([run/0]).

run() ->
    L = [5, 3, 5, 1, 3, 9, 1],
    io:format("~p~n", [lists:sort(L)]),
    io:format("~p~n", [lists:usort(L)]),
    io:format("~p~n", [lists:reverse(lists:usort(L))]),
    io:format("~p~n", [lists:usort(fun(A, B) -> A >= B end, L)]),
    io:format("~p~n", [lists:umerge([1, 3, 5], [2, 3, 6])]).
