-module(rabin_karp_search).
-export([search/2]).

-define(BASE, 256).
-define(MODULUS, 1000000007).

search(Text, Pattern) ->
    N = length(Text),
    M = length(Pattern),
    case M =:= 0 orelse M > N of
        true -> -1;
        false ->
            TextT = list_to_tuple(Text),
            PatternHash = hash(Pattern),
            High = pow(?BASE, M - 1),
            InitialWindow = lists:sublist(Text, 1, M),
            InitialHash = hash(InitialWindow),
            try_match(TextT, Pattern, PatternHash, InitialHash, High, N, M, 0)
    end.

try_match(_TextT, _Pattern, _PHash, _Hash, _High, N, M, I) when I > N - M -> -1;
try_match(TextT, Pattern, PHash, Hash, High, N, M, I) ->
    case Hash =:= PHash andalso slice_matches(TextT, Pattern, I, M) of
        true -> I;
        false ->
            case I =:= N - M of
                true -> -1;
                false ->
                    OldChar = element(I + 1, TextT),
                    NewChar = element(I + M + 1, TextT),
                    NextHash = roll(Hash, OldChar, NewChar, High),
                    try_match(TextT, Pattern, PHash, NextHash, High, N, M, I + 1)
            end
    end.

slice_matches(TextT, Pattern, I, M) ->
    Slice = [element(I + K, TextT) || K <- lists:seq(1, M)],
    Slice =:= Pattern.

roll(Hash, OldChar, NewChar, High) ->
    Raw = (Hash - OldChar * High) * ?BASE + NewChar,
    Mod = Raw rem ?MODULUS,
    case Mod < 0 of
        true -> Mod + ?MODULUS;
        false -> Mod
    end.

hash(Chars) ->
    lists:foldl(fun(C, Acc) -> (Acc * ?BASE + C) rem ?MODULUS end, 0, Chars).

pow(Base, Exp) -> pow(Base, Exp, 1).
pow(_Base, 0, Acc) -> Acc;
pow(Base, Exp, Acc) -> pow(Base, Exp - 1, (Acc * Base) rem ?MODULUS).
