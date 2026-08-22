-module(list_comprehension_demo).
-export([even_squares/1]).

even_squares(Numbers) ->
    [X * X || X <- Numbers, X rem 2 =:= 0].

main() ->
    io:format("~p~n", [even_squares(lists:seq(1, 10))]).
