-module(factorion_check).
-export([main/0]).

fact(0) -> 1;
fact(N) -> N * fact(N - 1).

is_factorion(N) ->
    Digits = [D - $0 || D <- integer_to_list(N)],
    lists:sum([fact(D) || D <- Digits]) =:= N.

main() ->
    io:format("~p~n", [[N || N <- lists:seq(1, 49999), is_factorion(N)]]).
