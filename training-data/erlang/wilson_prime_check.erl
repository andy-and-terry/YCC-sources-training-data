-module(wilson_prime_check).
-export([main/0]).
%% Wilson's theorem primality test.
wilson(N) when N < 2 -> false;
wilson(N) -> lists:foldl(fun(I, F) -> F * I rem N end, 1, lists:seq(2, N - 1)) =:= N - 1.
main() -> io:format("~p~n", [[N || N <- lists:seq(2, 19), wilson(N)]]).
