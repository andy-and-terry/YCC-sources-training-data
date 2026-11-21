-module(perfect_totient_numbers).
-export([main/0]).

%% Perfect totient numbers: sum of the iterated totient chain down to 1 equals n.
gcd(A, 0) -> A;
gcd(A, B) -> gcd(B, A rem B).

phi(N) -> length([K || K <- lists:seq(1, N), gcd(K, N) =:= 1]).

chain_sum(M) when M =< 1 -> 0;
chain_sum(M) -> phi(M) + chain_sum(phi(M)).

main() ->
    Found = [integer_to_list(N) || N <- lists:seq(2, 199), chain_sum(N) =:= N],
    io:format("~s~n", [string:join(Found, " ")]).
