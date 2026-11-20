-module(goldbach_pair).
-export([main/0]).
%% Goldbach pair.
is_prime(N) when N < 2 -> false;
is_prime(N) -> lists:all(fun(D) -> N rem D =/= 0 end, lists:seq(2, trunc(math:sqrt(N)))).
goldbach(N) -> hd([{P, N - P} || P <- lists:seq(2, N div 2), is_prime(P), is_prime(N - P)]).
main() -> io:format("~p~n", [goldbach(28)]).
