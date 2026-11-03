-module(primes_below_count).
-export([main/0, count/1]).

count(N) when N < 3 -> 0;
count(N) -> length(sieve(lists:seq(2, N - 1))).

sieve([]) -> [];
sieve([P | Rest]) -> [P | sieve([X || X <- Rest, X rem P =/= 0])].

main() -> io:format("~p~n", [count(100)]).
