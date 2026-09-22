-module(word_break).
-export([can_break/2]).

can_break([], _Dict) -> true;
can_break(Word, Dict) ->
    Prefixes = [lists:sublist(Word, L) || L <- lists:seq(1, length(Word))],
    lists:any(
        fun(Prefix) ->
            lists:member(Prefix, Dict) andalso can_break(lists:nthtail(length(Prefix), Word), Dict)
        end,
        Prefixes
    ).

main() ->
    io:format("~p~n", [can_break("leetcode", ["leet", "code"])]).
