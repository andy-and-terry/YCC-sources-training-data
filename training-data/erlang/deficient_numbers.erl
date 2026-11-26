%% Deficient numbers below 100; expect 76.
-module(deficient_numbers).
-export([main/0]).

proper_sum(N) -> lists:sum([D || D <- lists:seq(1, N - 1), N rem D =:= 0]).

main() ->
    io:format("~p~n", [length([N || N <- lists:seq(1, 99), proper_sum(N) < N])]).
