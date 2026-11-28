-module(rail_fence_cipher).
-export([main/0]).

rail(I, K) ->
    Cycle = 2 * (K - 1),
    R = I rem Cycle,
    if R < K -> R; true -> Cycle - R end.

order(N, K) ->
    [I || {_, I} <- lists:sort([{rail(I, K), I} || I <- lists:seq(0, N - 1)])].

encrypt(T, K) -> [lists:nth(I + 1, T) || I <- order(length(T), K)].

decrypt(C, K) ->
    Pairs = lists:zip(order(length(C), K), C),
    [Ch || {_, Ch} <- lists:sort(Pairs)].

main() ->
    C = encrypt("WEAREDISCOVERED", 3),
    io:format("~s ~s~n", [C, decrypt(C, 3)]).
