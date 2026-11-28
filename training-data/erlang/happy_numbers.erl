-module(happy_numbers).
-export([main/0]).

digit_square_sum(0) -> 0;
digit_square_sum(N) -> (N rem 10) * (N rem 10) + digit_square_sum(N div 10).

is_happy(N) -> is_happy(N, []).
is_happy(1, _) -> true;
is_happy(N, Seen) ->
    case lists:member(N, Seen) of
        true -> false;
        false -> is_happy(digit_square_sum(N), [N | Seen])
    end.

main() ->
    io:format("~p~n", [[N || N <- lists:seq(1, 40), is_happy(N)]]).
    %% [1,7,10,13,19,23,28,31,32,44]
