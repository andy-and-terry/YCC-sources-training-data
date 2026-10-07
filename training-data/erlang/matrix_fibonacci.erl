-module(matrix_fibonacci).
-export([fib/1, run/0]).

mul({A, B, C, D}, {E, F, G, H}) ->
    {A * E + B * G, A * F + B * H, C * E + D * G, C * F + D * H}.

fib(N) ->
    {_, Result, _, _} = power({1, 1, 1, 0}, N, {1, 0, 0, 1}),
    Result.

power(_Base, 0, Acc) -> Acc;
power(Base, N, Acc) when N rem 2 =:= 1 ->
    power(mul(Base, Base), N div 2, mul(Acc, Base));
power(Base, N, Acc) ->
    power(mul(Base, Base), N div 2, Acc).

run() ->
    [io:format("fib(~p) = ~p~n", [N, fib(N)]) || N <- [1, 10, 50, 90, 200]],
    ok.
