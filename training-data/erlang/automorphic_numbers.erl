-module(automorphic_numbers).
-export([main/0]).

is_automorphic(N) ->
    S = integer_to_list(N * N),
    T = integer_to_list(N),
    lists:suffix(T, S).

main() ->
    io:format("~p~n", [[N || N <- lists:seq(0, 999), is_automorphic(N)]]).
    %% [0,1,5,6,25,76,376,625]
