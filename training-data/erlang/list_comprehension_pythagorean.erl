-module(list_comprehension_pythagorean).
-export([run/0, triples/1]).

triples(N) ->
    [{A, B, C} || A <- lists:seq(1, N), B <- lists:seq(A, N),
                  C <- lists:seq(B, N), A * A + B * B =:= C * C].

run() -> io:format("~p~n", [triples(20)]).
