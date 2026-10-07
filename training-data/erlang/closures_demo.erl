-module(closures_demo).
-export([run/0, make_adder/1, make_counter_fun/0]).

make_adder(N) ->
    fun(X) -> X + N end.

make_counter_fun() ->
    Gen = fun Loop(Count) ->
        fun() -> {Count, Loop(Count + 1)} end
    end,
    Gen(0).

run() ->
    Add5 = make_adder(5),
    io:format("~p~n", [Add5(10)]),
    io:format("~p~n", [lists:map(make_adder(1), [1, 2, 3])]),
    C0 = make_counter_fun(),
    {V0, C1} = C0(),
    {V1, _C2} = C1(),
    io:format("~p ~p~n", [V0, V1]).
