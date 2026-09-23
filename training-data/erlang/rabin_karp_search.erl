-module(rabin_karp_search).
-export([search/2]).

%% A simplified Rabin-Karp search: instead of maintaining a rolling
%% hash incrementally, each candidate window is hashed and compared
%% by hash first, then confirmed with an exact match to rule out hash
%% collisions, before sliding one position to the right.

search(Text, Pattern) ->
    N = length(Text),
    M = length(Pattern),
    search(Text, Pattern, hash(Pattern), N, M, 0).

search(_Text, _Pattern, _PatternHash, N, M, Start) when Start + M > N ->
    not_found;
search(Text, Pattern, PatternHash, N, M, Start) ->
    Window = lists:sublist(Text, Start + 1, M),
    case hash(Window) =:= PatternHash andalso Window =:= Pattern of
        true -> {found, Start};
        false -> search(Text, Pattern, PatternHash, N, M, Start + 1)
    end.

hash(Str) ->
    lists:foldl(fun(C, Acc) -> (Acc * 256 + C) rem 1000000007 end, 0, Str).

run() ->
    io:format("~p~n", [search("abxabcabcaby", "abcaby")]),
    io:format("~p~n", [search("hello world", "xyz")]).
