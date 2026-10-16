-module(function_compose_demo).
-export([run/0]).

compose(Fs) -> fun(X) -> lists:foldl(fun(F, Acc) -> F(Acc) end, X, Fs) end.

run() ->
    Inc = fun(X) -> X + 1 end,
    Dbl = fun(X) -> X * 2 end,
    Sq = fun(X) -> X * X end,
    io:format("~p~n", [(compose([Inc, Dbl, Sq]))(3)]),
    io:format("~p~n", [(compose([Sq, Dbl, Inc]))(3)]),
    io:format("~p~n", [(compose([]))(7)]).
