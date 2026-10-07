-module(merge_intervals).
-export([merge/1]).

merge(Intervals) ->
    Sorted = lists:sort(fun({S1, _}, {S2, _}) -> S1 =< S2 end, Intervals),
    lists:reverse(lists:foldl(fun step/2, [], Sorted)).

step({Start, End}, []) -> [{Start, End}];
step({Start, End}, [{PrevStart, PrevEnd} | Rest]) when Start =< PrevEnd ->
    [{PrevStart, max(PrevEnd, End)} | Rest];
step(Interval, Acc) -> [Interval | Acc].
