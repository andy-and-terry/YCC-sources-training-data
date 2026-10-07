-module(lfu_cache).
-export([new/1, get/2, put/3]).

new(Capacity) -> {Capacity, #{}, #{}}.

get(Key, {Capacity, Values, Freq}) ->
    case maps:find(Key, Values) of
        {ok, Value} ->
            Freq1 = maps:update_with(Key, fun(F) -> F + 1 end, Freq),
            {Value, {Capacity, Values, Freq1}};
        error ->
            {not_found, {Capacity, Values, Freq}}
    end.

put(_Key, _Value, {0, Values, Freq}) -> {0, Values, Freq};
put(Key, Value, {Capacity, Values, Freq}) when is_map_key(Key, Values) ->
    Freq1 = maps:update_with(Key, fun(F) -> F + 1 end, Freq),
    {Capacity, maps:put(Key, Value, Values), Freq1};
put(Key, Value, {Capacity, Values, Freq}) when map_size(Values) >= Capacity ->
    {EvictKey, _} = hd(lists:keysort(2, maps:to_list(Freq))),
    Values1 = maps:put(Key, Value, maps:remove(EvictKey, Values)),
    Freq1 = maps:put(Key, 1, maps:remove(EvictKey, Freq)),
    {Capacity, Values1, Freq1};
put(Key, Value, {Capacity, Values, Freq}) ->
    {Capacity, maps:put(Key, Value, Values), maps:put(Key, 1, Freq)}.
