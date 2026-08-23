-module(lru_cache).
-export([new/1, get/2, put/3]).

new(Capacity) -> {Capacity, #{}, []}.

get({Capacity, Map, Order}, Key) ->
    case maps:find(Key, Map) of
        {ok, Value} ->
            NewOrder = [Key | lists:delete(Key, Order)],
            {Value, {Capacity, Map, NewOrder}};
        error ->
            {not_found, {Capacity, Map, Order}}
    end.

put({Capacity, Map, Order}, Key, Value) ->
    NewMap = maps:put(Key, Value, Map),
    NewOrder = [Key | lists:delete(Key, Order)],
    case length(NewOrder) > Capacity of
        true ->
            ToEvict = lists:last(NewOrder),
            {Capacity, maps:remove(ToEvict, NewMap), lists:droplast(NewOrder)};
        false ->
            {Capacity, NewMap, NewOrder}
    end.
