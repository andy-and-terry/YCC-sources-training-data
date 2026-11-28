-module(emirp_primes).
-export([main/0]).

is_prime(N) when N < 2 -> false;
is_prime(N) -> is_prime(N, 2).
is_prime(N, I) when I * I > N -> true;
is_prime(N, I) when N rem I =:= 0 -> false;
is_prime(N, I) -> is_prime(N, I + 1).

rev(N) -> list_to_integer(lists:reverse(integer_to_list(N))).

main() ->
    Es = [P || P <- lists:seq(2, 99), is_prime(P), rev(P) =/= P, is_prime(rev(P))],
    io:format("~p~n", [Es]).
