-module(sets_demo).
-export([run/0]).

run() ->
    A = sets:from_list([1, 2, 3, 4]),
    B = sets:from_list([3, 4, 5, 6]),
    show(sets:union(A, B)),
    show(sets:intersection(A, B)),
    show(sets:subtract(A, B)),
    io:format("~p~n", [sets:is_element(2, A)]),
    io:format("~p~n", [sets:size(A)]),
    io:format("~p~n", [sets:is_subset(sets:from_list([1, 2]), A)]),
    show(sets:add_element(99, A)),
    show(sets:del_element(1, A)),
    show(sets:filter(fun(X) -> X rem 2 =:= 0 end, A)),
    io:format("~p~n", [sets:fold(fun(X, Acc) -> X + Acc end, 0, A)]).

show(Set) ->
    io:format("~p~n", [lists:sort(sets:to_list(Set))]).
