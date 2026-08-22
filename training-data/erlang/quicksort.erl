-module(quicksort).
-export([sort/1]).

sort([]) -> [];
sort([Pivot | Rest]) ->
    Smaller = [X || X <- Rest, X < Pivot],
    Larger = [X || X <- Rest, X >= Pivot],
    sort(Smaller) ++ [Pivot] ++ sort(Larger).
