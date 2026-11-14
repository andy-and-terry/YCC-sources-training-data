-module(list_comprehension_pythagorean).
-export([main/0]).

main() ->
    T = [{A, B, C} || A <- lists:seq(1, 20), B <- lists:seq(A, 20),
                      C <- lists:seq(B, 20), A * A + B * B =:= C * C],
    io:format("~p~n", [T]).
