-module(list_comprehension_filter_demo).
-export([run/0]).

run() ->
    Evens = [X || X <- lists:seq(1, 10), X rem 2 =:= 0],
    io:format("~p~n", [Evens]),
    Pairs = [{X, Y} || X <- [1, 2, 3], Y <- [a, b]],
    io:format("~p~n", [Pairs]),
    Triples = [{A, B, C} || C <- lists:seq(1, 20), B <- lists:seq(1, C), A <- lists:seq(1, B),
                            A * A + B * B =:= C * C],
    io:format("~p~n", [Triples]).
