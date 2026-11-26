%% Emirps below 200; expect 15.
-module(emirps).
-export([main/0]).

is_prime(N) when N < 2 -> false;
is_prime(N) -> is_prime(N, 2).
is_prime(N, D) when D * D > N -> true;
is_prime(N, D) when N rem D =:= 0 -> false;
is_prime(N, D) -> is_prime(N, D + 1).
rev(N) -> list_to_integer(lists:reverse(integer_to_list(N))).

main() ->
    Found = [N || N <- lists:seq(2, 199), rev(N) =/= N, is_prime(N), is_prime(rev(N))],
    io:format("~p ~p~n", [length(Found), Found]).
