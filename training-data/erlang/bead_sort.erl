-module(bead_sort).
-export([main/0]).
%% Bead (gravity) sort.
sort(Nums) ->
    Cols = [length([N || N <- Nums, N >= I]) || I <- lists:seq(1, lists:max(Nums))],
    lists:reverse([length([C || C <- Cols, C >= R]) || R <- lists:seq(1, length(Nums))]).
main() -> io:format("~p~n", [sort([5, 3, 1, 4, 2])]).
