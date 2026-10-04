-module(closures_demo).
-export([run/0, make_adder/1, compose/2, counter/0]).

make_adder(N) -> fun(X) -> X + N end.

compose(F, G) -> fun(X) -> F(G(X)) end.

%% A "counter" closure backed by a process, since Erlang has no mutable state.
counter() ->
    Pid = spawn(fun() -> loop(0) end),
    fun() ->
        Pid ! {next, self()},
        receive {value, V} -> V after 1000 -> timeout end
    end.

loop(N) ->
    receive
        {next, From} -> From ! {value, N + 1}, loop(N + 1)
    end.

run() ->
    Add5 = make_adder(5),
    Double = fun(X) -> X * 2 end,
    io:format("~p~n", [Add5(10)]),
    io:format("~p~n", [(compose(Add5, Double))(10)]),
    Next = counter(),
    io:format("~p ~p ~p~n", [Next(), Next(), Next()]),
    Fact = fun F(0) -> 1; F(N) -> N * F(N - 1) end,
    io:format("~p~n", [Fact(6)]).
