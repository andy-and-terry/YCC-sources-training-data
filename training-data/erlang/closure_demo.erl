-module(closure_demo).
-export([run/0, make_counter_step/1, compose/2]).

make_counter_step(Step) ->
    fun(N) -> N + Step end.

compose(F, G) ->
    fun(X) -> F(G(X)) end.

run() ->
    AddFive = make_counter_step(5),
    io:format("~p~n", [AddFive(10)]),
    Double = fun(X) -> X * 2 end,
    DoubleThenAddFive = compose(AddFive, Double),
    io:format("~p~n", [DoubleThenAddFive(10)]),
    io:format("~p~n", [lists:map(DoubleThenAddFive, [1, 2, 3])]),
    Fact = fun F(0) -> 1; F(N) -> N * F(N - 1) end,
    io:format("~p~n", [Fact(6)]),
    Ref = fun lists:reverse/1,
    io:format("~p~n", [Ref([1, 2, 3])]),
    io:format("~p~n", [erlang:fun_info(AddFive, arity)]).
