-module(merge_sort).
-export([sort/1]).

sort([]) -> [];
sort([X]) -> [X];
sort(List) ->
    {Left, Right} = lists:split(length(List) div 2, List),
    merge(sort(Left), sort(Right)).

merge([], Right) -> Right;
merge(Left, []) -> Left;
merge([L | Ls], [R | Rs]) when L =< R ->
    [L | merge(Ls, [R | Rs])];
merge(Left, [R | Rs]) ->
    [R | merge(Left, Rs)].
