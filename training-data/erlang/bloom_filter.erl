-module(bloom_filter).
-export([new/1, add/2, might_contain/2]).

new(Size) -> {Size, sets:new()}.

hash1(Value, Size) -> erlang:phash2(Value, Size).

hash2(Value, Size) -> erlang:phash2({salt, Value}, Size).

add(Value, {Size, Bits}) ->
    Bits1 = sets:add_element(hash1(Value, Size), Bits),
    Bits2 = sets:add_element(hash2(Value, Size), Bits1),
    {Size, Bits2}.

might_contain(Value, {Size, Bits}) ->
    sets:is_element(hash1(Value, Size), Bits) andalso
        sets:is_element(hash2(Value, Size), Bits).
