-module(map_comprehension_demo).
-export([run/0]).

run() ->
    Squares = #{X => X * X || X <- lists:seq(1, 5)},
    io:format("~p~n", [Squares]),
    Big = #{K => V || K := V <- Squares, V > 5},
    io:format("~p~n", [lists:sort(maps:to_list(Big))]),
    Inverted = maps:from_list([{V, K} || K := V <- Squares]),
    io:format("~p~n", [maps:get(16, Inverted)]).
