-module(superperfect_numbers).
-export([main/0]).

sigma(N) -> lists:sum([D || D <- lists:seq(1, N), N rem D =:= 0]).

main() ->
    io:format("~p~n", [[N || N <- lists:seq(1, 99), sigma(sigma(N)) =:= 2 * N]]). % [2,4,16,64]
