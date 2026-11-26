%% Goldbach partitions of 100; expect 6.
-module(goldbach_pairs).
-export([main/0]).

is_prime(N) when N < 2 -> false;
is_prime(N) -> is_prime(N, 2).
is_prime(N, D) when D * D > N -> true;
is_prime(N, D) when N rem D =:= 0 -> false;
is_prime(N, D) -> is_prime(N, D + 1).

main() ->
    Pairs = [{P, 100 - P} || P <- lists:seq(2, 50), is_prime(P), is_prime(100 - P)],
    io:format("~p ~p~n", [length(Pairs), Pairs]).
