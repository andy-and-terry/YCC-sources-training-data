-module(counting_sort).
-export([sort/1]).

sort([]) -> [];
sort(List) ->
    Max = lists:max(List),
    Counts0 = maps:from_list([{V, 0} || V <- lists:seq(0, Max)]),
    Counts = lists:foldl(
        fun(V, Acc) -> maps:update_with(V, fun(C) -> C + 1 end, 1, Acc) end,
        Counts0,
        List
    ),
    lists:flatmap(
        fun(V) -> lists:duplicate(maps:get(V, Counts), V) end,
        lists:seq(0, Max)
    ).

main() ->
    io:format("~p~n", [sort([4, 2, 2, 8, 3, 3, 1])]).
