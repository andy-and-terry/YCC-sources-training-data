-module(list_comprehension_ex).
-export([main/0]).

main() ->
    Evens = [X * X || X <- lists:seq(1, 10), X rem 2 =:= 0],
    Pairs = [{A, B} || A <- [1, 2], B <- [a, b]],
    io:format("~p~n~p~n", [Evens, Pairs]).
