-module(word_wrap_greedy).
-export([main/0, wrap/2]).

wrap(Text, Width) ->
    Words = string:tokens(Text, " "),
    lists:reverse(wrap(Words, Width, "", [])).

wrap([], _W, "", Acc) -> Acc;
wrap([], _W, Line, Acc) -> [Line | Acc];
wrap([Word | Rest], W, "", Acc) -> wrap(Rest, W, Word, Acc);
wrap([Word | Rest], W, Line, Acc) ->
    case length(Line) + 1 + length(Word) > W of
        true -> wrap(Rest, W, Word, [Line | Acc]);
        false -> wrap(Rest, W, Line ++ " " ++ Word, Acc)
    end.

main() ->
    [io:format("|~-15s|~n", [L]) || L <- wrap("the quick brown fox jumps over the lazy dog", 15)],
    ok.
