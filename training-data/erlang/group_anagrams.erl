-module(group_anagrams).
-export([group/1]).

group(Words) ->
    Grouped = lists:foldl(fun(Word, Acc) ->
        Key = lists:sort(Word),
        maps:update_with(Key, fun(List) -> [Word | List] end, [Word], Acc)
    end, #{}, Words),
    maps:values(Grouped).
