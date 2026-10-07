-module(quickselect).
-export([kth_smallest/2]).

kth_smallest(List, K) ->
    lists:nth(K, quicksort(List)).

quicksort([]) -> [];
quicksort([Pivot | Rest]) ->
    Smaller = [X || X <- Rest, X =< Pivot],
    Larger = [X || X <- Rest, X > Pivot],
    quicksort(Smaller) ++ [Pivot] ++ quicksort(Larger).
