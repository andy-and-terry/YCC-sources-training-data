-module(trie).
-export([new/0, insert/2, contains/2]).

new() -> #{}.

insert(Trie, Word) -> insert_chars(Trie, Word).

insert_chars(Trie, []) -> maps:put(is_end, true, Trie);
insert_chars(Trie, [C | Rest]) ->
    Child = maps:get(C, Trie, #{}),
    maps:put(C, insert_chars(Child, Rest), Trie).

contains(Trie, Word) -> walk(Trie, Word).

walk(Trie, []) -> maps:get(is_end, Trie, false);
walk(Trie, [C | Rest]) ->
    case maps:find(C, Trie) of
        {ok, Child} -> walk(Child, Rest);
        error -> false
    end.
