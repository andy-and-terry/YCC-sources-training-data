-module(bit_reversal).
-export([main/0]).

reverse_bits(V) -> reverse_bits(8, V, 0).
reverse_bits(0, _, Acc) -> Acc;
reverse_bits(K, V, Acc) ->
    reverse_bits(K - 1, V bsr 1, (Acc bsl 1) bor (V band 1)).

main() ->
    [io:format("~p ~p~n", [V, reverse_bits(V)]) || V <- [1, 6, 13, 128]].
    %% 128 96 176 1
