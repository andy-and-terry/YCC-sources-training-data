-module(sets_demo).
-export([run/0]).

run() ->
    A = sets:from_list([1, 2, 3, 4, 5]),
    B = sets:from_list([4, 5, 6, 7]),
    Show = fun(Label, S) -> io:format("~s: ~p~n", [Label, lists:sort(sets:to_list(S))]) end,
    Show("union", sets:union(A, B)),
    Show("intersection", sets:intersection(A, B)),
    Show("difference", sets:subtract(A, B)),
    io:format("subset: ~p~n", [sets:is_subset(sets:from_list([1, 2]), A)]),
    io:format("member: ~p~n", [sets:is_element(3, A)]),
    io:format("size: ~p~n", [sets:size(sets:add_element(10, A))]),
    Unique = lists:sort(sets:to_list(sets:from_list([3, 1, 3, 2, 1]))),
    io:format("unique: ~p~n", [Unique]).
