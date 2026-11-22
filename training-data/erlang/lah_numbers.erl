-module(lah_numbers).
-export([main/0]).

%% Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5).
fact(N) when N =< 1 -> 1;
fact(N) -> N * fact(N - 1).

comb(N, K) -> fact(N) div (fact(K) * fact(N - K)).

main() ->
    N = 5,
    L = [comb(N - 1, K - 1) * fact(N) div fact(K) || K <- lists:seq(1, N)],
    io:format("~s~n", [string:join([integer_to_list(X) || X <- L], " ")]).
