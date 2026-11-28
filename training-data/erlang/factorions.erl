-module(factorions).
-export([main/0]).

fact(0) -> 1;
fact(N) -> N * fact(N - 1).

is_factorion(N) ->
    lists:sum([fact(C - $0) || C <- integer_to_list(N)]) =:= N.

main() ->
    io:format("~p~n", [[N || N <- lists:seq(1, 49999), is_factorion(N)]]).   %% [1,2,145,40585]
