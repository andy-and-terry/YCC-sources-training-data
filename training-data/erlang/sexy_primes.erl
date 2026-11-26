%% Sexy primes below 100; expect 16 pairs.
-module(sexy_primes).
-export([main/0]).

is_prime(N) when N < 2 -> false;
is_prime(N) -> is_prime(N, 2).
is_prime(N, D) when D * D > N -> true;
is_prime(N, D) when N rem D =:= 0 -> false;
is_prime(N, D) -> is_prime(N, D + 1).

main() ->
    io:format("~p~n", [length([P || P <- lists:seq(2, 99), is_prime(P), is_prime(P + 6)])]).
