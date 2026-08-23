-module(kmp_search).
-export([search/2]).

search(Text, Pattern) ->
    Lps = build_lps(Pattern),
    do_search(Text, Pattern, Lps, 0, 0).

build_lps(Pattern) ->
    N = length(Pattern),
    build_lps(list_to_tuple(Pattern), N, array:new(N, {default, 0}), 1, 0).

build_lps(_P, N, Lps, I, _Len) when I >= N -> array:to_list(Lps);
build_lps(P, N, Lps, I, Len) ->
    case element(I + 1, P) =:= element(Len + 1, P) of
        true -> build_lps(P, N, array:set(I, Len + 1, Lps), I + 1, Len + 1);
        false ->
            case Len =/= 0 of
                true -> build_lps(P, N, Lps, I, array:get(Len - 1, Lps));
                false -> build_lps(P, N, Lps, I + 1, 0)
            end
    end.

do_search(Text, Pattern, Lps, I, J) ->
    LpsT = list_to_tuple(Lps),
    N = length(Text),
    M = length(Pattern),
    TextT = list_to_tuple(Text),
    PatT = list_to_tuple(Pattern),
    loop(TextT, PatT, LpsT, N, M, I, J).

loop(_T, _P, _Lps, N, M, I, J) when J =:= M -> I - J;
loop(_T, _P, _Lps, N, _M, I, _J) when I >= N -> -1;
loop(T, P, Lps, N, M, I, J) ->
    case element(I + 1, T) =:= element(J + 1, P) of
        true -> loop(T, P, Lps, N, M, I + 1, J + 1);
        false ->
            case J > 0 of
                true -> loop(T, P, Lps, N, M, I, element(J, Lps));
                false -> loop(T, P, Lps, N, M, I + 1, 0)
            end
    end.
