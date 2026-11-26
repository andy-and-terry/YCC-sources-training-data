%% Circular primes below 100; expect 13.
-module(circular_primes).
-export([main/0]).

is_prime(N) when N < 2 -> false;
is_prime(N) -> is_prime(N, 2).
is_prime(N, D) when D * D > N -> true;
is_prime(N, D) when N rem D =:= 0 -> false;
is_prime(N, D) -> is_prime(N, D + 1).
circular(N) ->
    S = integer_to_list(N),
    lists:all(fun(I) ->
        {A, B} = lists:split(I, S),
        is_prime(list_to_integer(B ++ A))
    end, lists:seq(0, length(S) - 1)).

main() ->
    io:format("~p~n", [length([N || N <- lists:seq(2, 99), circular(N)])]).
