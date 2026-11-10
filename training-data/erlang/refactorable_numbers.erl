-module(refactorable_numbers).
-export([main/0]).

tau(N) -> length([D || D <- lists:seq(1, N), N rem D =:= 0]).

main() ->
    io:format("~p~n", [[N || N <- lists:seq(1, 59), N rem tau(N) =:= 0]]). % [1,2,8,9,12,18,24,36,40,56]
