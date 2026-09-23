-module(longest_palindromic_substring).
-export([longest/1]).

%% Expand-around-center: every index is tried as the center of an odd
%% length palindrome, and every adjacent pair as the center of an even
%% length one, growing outward while the two ends still match.

longest(S) ->
    N = length(S),
    Odd = [expand(S, N, I, I) || I <- lists:seq(1, N)],
    Even = [expand(S, N, I, I + 1) || I <- lists:seq(1, N - 1)],
    lists:foldl(fun longer/2, "", Odd ++ Even).

expand(S, N, L, R) when L >= 1, R =< N, lists:nth(L, S) =:= lists:nth(R, S) ->
    expand(S, N, L - 1, R + 1);
expand(S, _N, L, R) ->
    lists:sublist(S, L + 1, R - L - 1).

longer(A, B) ->
    case length(A) > length(B) of
        true -> A;
        false -> B
    end.

run() ->
    io:format("~p~n", [longest("babad")]),
    io:format("~p~n", [longest("cbbd")]).
