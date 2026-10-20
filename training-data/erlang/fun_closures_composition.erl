-module(fun_closures_composition).
-export([main/0]).

compose(F, G) -> fun(X) -> G(F(X)) end.
make_adder(N) -> fun(X) -> X + N end.

main() ->
    Add5 = make_adder(5),
    Dbl = fun(X) -> X * 2 end,
    io:format("~p~n", [(compose(Add5, Dbl))(1)]),
    Fact = fun F(0) -> 1; F(N) -> N * F(N - 1) end,
    io:format("~p~n", [Fact(10)]),
    Fs = [fun lists:sum/1, fun lists:max/1, fun erlang:length/1],
    io:format("~p~n", [[F([3, 1, 2]) || F <- Fs]]).
