-module(lah_numbers).
-export([main/0]).

fact(N) -> lists:foldl(fun(X, A) -> X * A end, 1, lists:seq(1, max(N, 1))).
comb(N, K) -> fact(N) div (fact(K) * fact(N - K)).
lah(N, K) -> comb(N - 1, K - 1) * fact(N) div fact(K).

main() ->
    [io:format("~p~n", [[lah(N, K) || K <- lists:seq(1, N)]]) || N <- lists:seq(1, 5)],
    ok.
