-module(gcd_of_list).
-export([main/0, gcd/2, gcd_all/1]).

gcd(A, 0) -> abs(A);
gcd(A, B) -> gcd(B, A rem B).

gcd_all(Nums) -> lists:foldl(fun(N, Acc) -> gcd(Acc, N) end, 0, Nums).

main() ->
    io:format("~p~n", [gcd_all([12, 18, 24])]),
    io:format("~p~n", [gcd_all([7, 13])]).
