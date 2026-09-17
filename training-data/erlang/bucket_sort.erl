-module(bucket_sort).
-export([sort/1]).

sort([]) -> [];
sort(List) ->
    Max = lists:max(List),
    Min = lists:min(List),
    NumBuckets = length(List),
    Range = Max - Min + 1,
    Buckets0 = lists:duplicate(NumBuckets, []),
    Buckets = lists:foldl(
        fun(V, Acc) ->
            Index = ((V - Min) * NumBuckets) div Range,
            Idx = min(Index, NumBuckets - 1) + 1,
            Current = lists:nth(Idx, Acc),
            replace_nth(Acc, Idx, [V | Current])
        end,
        Buckets0,
        List
    ),
    lists:flatmap(fun(B) -> lists:sort(B) end, Buckets).

replace_nth(List, Index, Value) ->
    {Before, [_ | After]} = lists:split(Index - 1, List),
    Before ++ [Value | After].

main() ->
    io:format("~p~n", [sort([29, 25, 3, 49, 9, 37, 21, 43])]).
