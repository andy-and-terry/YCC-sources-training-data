-module(semiprime_check).
-export([main/0]).

prime_factor_count(N) -> prime_factor_count(N, 2, 0).

prime_factor_count(N, P, Count) when P * P > N ->
    if N > 1 -> Count + 1; true -> Count end;
prime_factor_count(N, P, Count) when N rem P =:= 0 ->
    prime_factor_count(N div P, P, Count + 1);
prime_factor_count(N, P, Count) ->
    prime_factor_count(N, P + 1, Count).

main() ->
    io:format("~p~n", [[N || N <- lists:seq(2, 29), prime_factor_count(N) =:= 2]]).
