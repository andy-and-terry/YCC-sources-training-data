-module(word_frequency).
-export([count/1]).

count(Text) ->
    Words = string:tokens(string:to_lower(Text), " "),
    lists:foldl(
        fun(Word, Acc) -> maps:update_with(Word, fun(N) -> N + 1 end, 1, Acc) end,
        #{},
        Words
    ).
