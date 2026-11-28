-module(emirp_numbers).
-export([main/0]).

is_prime(N) when N < 2 -> false;
is_prime(N) -> is_prime(N, 2).
is_prime(N, D) when D * D > N -> true;
is_prime(N, D) when N rem D =:= 0 -> false;
is_prime(N, D) -> is_prime(N, D + 1).

rev(N) -> list_to_integer(lists:reverse(integer_to_list(N))).

main() ->
    Emirps = [P || P <- lists:seq(2, 199), rev(P) =/= P, is_prime(P), is_prime(rev(P))],
    io:format("~p~n", [Emirps]).
    %% [13,17,31,37,71,73,79,97,107,113,149,157,167,179,199]
