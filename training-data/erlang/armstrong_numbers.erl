-module(armstrong_numbers).
-export([main/0]).

is_armstrong(N) ->
    Digits = [C - $0 || C <- integer_to_list(N)],
    Len = length(Digits),
    lists:sum([round(math:pow(D, Len)) || D <- Digits]) =:= N.

main() ->
    io:format("~p~n", [[N || N <- lists:seq(1, 999), is_armstrong(N)]]).
    %% [1,2,...,9,153,370,371,407]
