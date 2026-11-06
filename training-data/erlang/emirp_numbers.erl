%% Emirps: primes whose digit reversal is a different prime.
-module(emirp_numbers).
-export([main/0]).

is_prime(N) when N < 2 -> false;
is_prime(N) -> lists:all(fun(I) -> N rem I =/= 0 end, lists:seq(2, trunc(math:sqrt(N)))).

reverse(N) -> list_to_integer(lists:reverse(integer_to_list(N))).

main() ->
    Emirps = [N || N <- lists:seq(2, 99), reverse(N) =/= N, is_prime(N), is_prime(reverse(N))],
    io:format("~p~n", [Emirps]).
