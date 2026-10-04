-module(sets_demo).
-export([main/0]).

main() ->
    A = sets:from_list([1, 2, 3, 4]),
    B = sets:from_list([3, 4, 5, 6]),
    io:format("union: ~p~n", [lists:sort(sets:to_list(sets:union(A, B)))]),
    io:format("intersection: ~p~n", [lists:sort(sets:to_list(sets:intersection(A, B)))]),
    io:format("difference: ~p~n", [lists:sort(sets:to_list(sets:subtract(A, B)))]),
    io:format("is_element 3: ~p~n", [sets:is_element(3, A)]),
    io:format("subset: ~p~n", [sets:is_subset(sets:from_list([1, 2]), A)]),
    C = sets:add_element(2, A),
    io:format("size after duplicate add: ~p~n", [sets:size(C)]),
    D = sets:del_element(1, C),
    io:format("after delete: ~p~n", [lists:sort(sets:to_list(D))]),
    Evens = sets:filter(fun(X) -> X rem 2 =:= 0 end, A),
    io:format("evens: ~p~n", [lists:sort(sets:to_list(Evens))]).
