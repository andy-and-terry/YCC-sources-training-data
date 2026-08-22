-module(is_prime).
-export([primes_up_to/1]).

is_prime(N) when N < 2 -> false;
is_prime(N) -> check(N, 2).

check(N, D) when D * D > N -> true;
check(N, D) ->
    case N rem D of
        0 -> false;
        _ -> check(N, D + 1)
    end.

primes_up_to(Limit) ->
    [N || N <- lists:seq(2, Limit), is_prime(N)].
