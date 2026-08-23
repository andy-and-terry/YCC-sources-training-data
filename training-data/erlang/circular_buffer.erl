-module(circular_buffer).
-export([new/1, push/2, to_list/1]).

new(Capacity) -> {Capacity, #{}, 0, 0}.

push({Capacity, Data, Size, Start}, Value) ->
    Index = (Start + Size) rem Capacity,
    case Size < Capacity of
        true -> {Capacity, maps:put(Index, Value, Data), Size + 1, Start};
        false -> {Capacity, maps:put(Index, Value, Data), Size, (Start + 1) rem Capacity}
    end.

to_list({Capacity, Data, Size, Start}) ->
    [maps:get((Start + I) rem Capacity, Data) || I <- lists:seq(0, Size - 1)].
