-module(perfect_numbers).
-export([run/0, aliquot_sum/1, classify/1]).

aliquot_sum(N) when N < 2 -> 0;
aliquot_sum(N) -> 1 + divisors(2, N, 0).

divisors(I, N, Acc) when I * I > N -> Acc;
divisors(I, N, Acc) when N rem I =:= 0 ->
    Other = N div I,
    Add = if Other =:= I -> I; true -> I + Other end,
    divisors(I + 1, N, Acc + Add);
divisors(I, N, Acc) -> divisors(I + 1, N, Acc).

classify(N) ->
    case aliquot_sum(N) of
        S when S =:= N -> perfect;
        S when S > N -> abundant;
        _ -> deficient
    end.

run() ->
    [io:format("~p: ~p~n", [N, classify(N)]) || N <- [6, 12, 15, 28, 496]],
    Perfect = [N || N <- lists:seq(2, 10000), classify(N) =:= perfect],
    io:format("perfect up to 10000: ~p~n", [Perfect]).
