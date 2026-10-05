-module(closures_demo).
-export([run/0, make_adder/1, compose/2]).

make_adder(N) -> fun(X) -> X + N end.

compose(F, G) -> fun(X) -> F(G(X)) end.

run() ->
    Add5 = make_adder(5),
    Double = fun(X) -> X * 2 end,
    io:format("~p~n", [Add5(10)]),
    io:format("~p~n", [(compose(Add5, Double))(10)]),
    io:format("~p~n", [lists:map(make_adder(1), [1, 2, 3])]),
    Fact = fun F(0) -> 1; F(N) -> N * F(N - 1) end,
    io:format("~p~n", [Fact(10)]),
    Counter = lists:foldl(fun(X, Acc) -> Acc + X end, 0, lists:seq(1, 100)),
    io:format("~p~n", [Counter]),
    Mod = fun lists:reverse/1,
    io:format("~p~n", [Mod([1, 2, 3])]).
