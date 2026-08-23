-module(sieve_of_eratosthenes).
-export([primes/1]).

primes(Limit) -> sieve(lists:seq(2, Limit)).

sieve([]) -> [];
sieve([P | Rest]) ->
    [P | sieve([X || X <- Rest, X rem P =/= 0])].
