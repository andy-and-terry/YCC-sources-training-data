-module(tail_recursive_loops_timer).
-export([main/0]).

loop(0, Acc) -> Acc;
loop(N, Acc) -> loop(N - 1, Acc + N).

main() ->
    {Micros, Result} = timer:tc(fun() -> loop(1000000, 0) end),
    io:format("~p ~p~n", [Result, Micros >= 0]),
    io:format("~p~n", [lists:foldl(fun(X, A) -> A bxor X end, 0, lists:seq(1, 100))]),
    io:format("~p ~p ~p~n", [7 div 2, 7 rem 2, -7 rem 3]),
    io:format("~p ~p~n", [math:pow(2, 10), trunc(3.99)]),
    io:format("~p~n", [erlang:phash2({a, b}) >= 0]).
