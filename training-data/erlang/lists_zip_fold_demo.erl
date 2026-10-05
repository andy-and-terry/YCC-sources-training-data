-module(lists_zip_fold_demo).
-export([run/0]).

run() ->
    Names = [alice, bob, carol],
    Ages = [30, 25, 41],
    Pairs = lists:zip(Names, Ages),
    io:format("~p~n", [Pairs]),
    {N, A} = lists:unzip(Pairs),
    io:format("~p ~p~n", [N, A]),
    io:format("~p~n", [lists:foldl(fun({_, Age}, Acc) -> Acc + Age end, 0, Pairs)]),
    io:format("~p~n", [lists:foldr(fun(X, Acc) -> [X * 2 | Acc] end, [], [1, 2, 3])]),
    io:format("~p~n", [lists:partition(fun(X) -> X rem 2 =:= 0 end, lists:seq(1, 10))]),
    io:format("~p~n", [lists:zipwith3(fun(X, Y, Z) -> X + Y + Z end, [1, 2], [10, 20], [100, 200])]),
    io:format("~p~n", [lists:mapfoldl(fun(X, Sum) -> {X * X, Sum + X} end, 0, [1, 2, 3])]),
    io:format("~p~n", [lists:splitwith(fun(X) -> X < 3 end, [1, 2, 3, 4, 1])]),
    io:format("~p~n", [lists:keysort(2, Pairs)]).
