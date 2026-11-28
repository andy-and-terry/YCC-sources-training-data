-module(palindromic_primes).
-export([main/0]).

is_prime(N) when N < 2 -> false;
is_prime(N) -> is_prime(N, 2).
is_prime(N, D) when D * D > N -> true;
is_prime(N, D) when N rem D =:= 0 -> false;
is_prime(N, D) -> is_prime(N, D + 1).

is_palindrome(N) ->
    S = integer_to_list(N),
    S =:= lists:reverse(S).

main() ->
    io:format("~p~n", [[N || N <- lists:seq(2, 199), is_palindrome(N), is_prime(N)]]).
    %% [2,3,5,7,11,101,131,151,181,191]
