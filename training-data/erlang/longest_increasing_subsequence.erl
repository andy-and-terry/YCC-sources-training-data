-module(longest_increasing_subsequence).
-export([length_of_lis/1]).

%% O(n^2) DP: Lengths[I] holds the length of the longest increasing
%% subsequence ending exactly at index I of the input list.
length_of_lis([]) -> 0;
length_of_lis(Nums) ->
    Arr = list_to_tuple(Nums),
    N = tuple_size(Arr),
    Lengths = compute_lengths(Arr, N, 0, array:new(N, {default, 1})),
    lists:max(array:to_list(Lengths)).

compute_lengths(_Arr, N, I, Lengths) when I =:= N -> Lengths;
compute_lengths(Arr, N, I, Lengths) ->
    Best = best_ending_at(Arr, I, 0, Lengths, 1),
    compute_lengths(Arr, N, I + 1, array:set(I, Best, Lengths)).

best_ending_at(_Arr, I, J, _Lengths, Best) when J >= I -> Best;
best_ending_at(Arr, I, J, Lengths, Best) ->
    NewBest = case element(J + 1, Arr) < element(I + 1, Arr) of
        true -> max(Best, array:get(J, Lengths) + 1);
        false -> Best
    end,
    best_ending_at(Arr, I, J + 1, Lengths, NewBest).

main() ->
    io:format("~p~n", [length_of_lis([10, 9, 2, 5, 3, 7, 101, 18])]).
