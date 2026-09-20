-module(rabin_karp_search).
-export([search/2, search_all/2]).

-define(BASE, 256).
-define(MOD, 1000000007).

search(Text, Pattern) ->
    case search_all(Text, Pattern) of
        [] -> -1;
        [First | _] -> First
    end.

search_all(Text, Pattern) ->
    N = length(Text),
    M = length(Pattern),
    case M =:= 0 orelse M > N of
        true -> [];
        false ->
            TextTuple = list_to_tuple(Text),
            PatternTuple = list_to_tuple(Pattern),
            PatternHash = hash_of(Pattern),
            HighOrder = power(?BASE, M - 1),
            InitialHash = hash_of(lists:sublist(Text, 1, M)),
            scan(TextTuple, PatternTuple, N, M, PatternHash, HighOrder, InitialHash, 0, [])
    end.

hash_of(Chars) ->
    lists:foldl(fun(C, Acc) -> (Acc * ?BASE + C) rem ?MOD end, 0, Chars).

power(_Base, 0) -> 1;
power(Base, Exp) -> (Base * power(Base, Exp - 1)) rem ?MOD.

roll_hash(OldHash, OldChar, NewChar, HighOrder) ->
    Removed = (OldHash - OldChar * HighOrder) rem ?MOD,
    Shifted = (Removed * ?BASE + NewChar) rem ?MOD,
    (Shifted + ?MOD) rem ?MOD.

matches(TextTuple, PatternTuple, Start, M) ->
    matches(TextTuple, PatternTuple, Start, M, 0).

matches(_TextTuple, _PatternTuple, _Start, M, K) when K =:= M -> true;
matches(TextTuple, PatternTuple, Start, M, K) ->
    case element(Start + K + 1, TextTuple) =:= element(K + 1, PatternTuple) of
        true -> matches(TextTuple, PatternTuple, Start, M, K + 1);
        false -> false
    end.

scan(_TextTuple, _PatternTuple, N, M, _PatternHash, _HighOrder, _CurrentHash, I, Acc)
        when I > N - M ->
    lists:reverse(Acc);
scan(TextTuple, PatternTuple, N, M, PatternHash, HighOrder, CurrentHash, I, Acc) ->
    Acc1 = case CurrentHash =:= PatternHash andalso matches(TextTuple, PatternTuple, I, M) of
        true -> [I | Acc];
        false -> Acc
    end,
    case I + M < N of
        true ->
            NextHash = roll_hash(CurrentHash,
                                  element(I + 1, TextTuple),
                                  element(I + M + 1, TextTuple),
                                  HighOrder),
            scan(TextTuple, PatternTuple, N, M, PatternHash, HighOrder, NextHash, I + 1, Acc1);
        false ->
            scan(TextTuple, PatternTuple, N, M, PatternHash, HighOrder, CurrentHash, I + 1, Acc1)
    end.

main() ->
    io:format("~p~n", [search_all("abracadabra", "abra")]).
