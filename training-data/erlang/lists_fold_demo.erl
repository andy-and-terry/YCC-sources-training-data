-module(lists_fold_demo).
-export([run/0]).

run() ->
    Nums = [1, 2, 3, 4, 5],
    Sum = lists:foldl(fun(X, Acc) -> X + Acc end, 0, Nums),
    Rev = lists:foldl(fun(X, Acc) -> [X | Acc] end, [], Nums),
    Right = lists:foldr(fun(X, Acc) -> [X * 2 | Acc] end, [], Nums),
    {Evens, Odds} = lists:partition(fun(X) -> X rem 2 =:= 0 end, Nums),
    io:format("~p ~p ~p~n", [Sum, Rev, Right]),
    io:format("~p ~p~n", [Evens, Odds]),
    io:format("~p~n", [lists:mapfoldl(fun(X, A) -> {X * A, A + 1} end, 1, Nums)]).
