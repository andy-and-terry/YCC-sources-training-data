-module(perfect_square_check).
-export([main/0, is_perfect_square/1]).

is_perfect_square(N) when N < 0 -> false;
is_perfect_square(N) ->
    R = round(math:sqrt(N)),
    R * R =:= N.

main() ->
    io:format("~p~n", [[N || N <- lists:seq(0, 29), is_perfect_square(N)]]).
