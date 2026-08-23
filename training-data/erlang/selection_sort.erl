-module(selection_sort).
-export([sort/1]).

sort([]) -> [];
sort(List) ->
    Min = lists:min(List),
    [Min | sort(lists:delete(Min, List))].
