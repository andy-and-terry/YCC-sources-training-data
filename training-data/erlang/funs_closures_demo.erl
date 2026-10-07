-module(funs_closures_demo).
-export([main/0, make_adder/1, make_counter/0]).

make_adder(N) ->
    fun(X) -> X + N end.

make_counter() ->
    Pid = spawn(fun() -> counter_loop(0) end),
    fun() ->
        Pid ! {next, self()},
        receive
            {count, C} -> C
        after 1000 -> timeout
        end
    end.

counter_loop(N) ->
    receive
        {next, From} ->
            From ! {count, N + 1},
            counter_loop(N + 1)
    end.

main() ->
    Add5 = make_adder(5),
    io:format("~p~n", [Add5(10)]),
    io:format("~p~n", [lists:map(make_adder(100), [1, 2, 3])]),
    Next = make_counter(),
    io:format("~p ~p ~p~n", [Next(), Next(), Next()]),
    Fact = fun F(0) -> 1;
               F(N) -> N * F(N - 1)
           end,
    io:format("~p~n", [Fact(6)]),
    Ref = fun lists:reverse/1,
    io:format("~p~n", [Ref([1, 2, 3])]).
