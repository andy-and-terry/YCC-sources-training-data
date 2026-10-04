-module(lists_fold_zip_demo).
-export([run/0]).

run() ->
    Nums = [3, 1, 4, 1, 5, 9, 2, 6],
    io:format("~p~n", [lists:foldl(fun(X, Acc) -> X + Acc end, 0, Nums)]),
    io:format("~p~n", [lists:foldr(fun(X, Acc) -> [X * 2 | Acc] end, [], Nums)]),
    io:format("~p~n", [lists:zip([a, b, c], [1, 2, 3])]),
    {Letters, Numbers} = lists:unzip([{x, 10}, {y, 20}]),
    io:format("~p ~p~n", [Letters, Numbers]),
    io:format("~p~n", [lists:zipwith(fun(A, B) -> A * B end, [1, 2, 3], [4, 5, 6])]),
    io:format("~p~n", [lists:mapfoldl(fun(X, Sum) -> {X * X, Sum + X} end, 0, [1, 2, 3])]),
    io:format("~p~n", [lists:partition(fun(X) -> X rem 2 =:= 0 end, Nums)]),
    io:format("~p~n", [lists:max(Nums)]),
    io:format("~p~n", [lists:usort(Nums)]).
