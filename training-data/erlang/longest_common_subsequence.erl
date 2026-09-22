-module(longest_common_subsequence).
-export([lcs/2]).

lcs([], _) -> [];
lcs(_, []) -> [];
lcs([X | Xs], [X | Ys]) ->
    [X | lcs(Xs, Ys)];
lcs([_ | Xs] = A, [_ | Ys] = B) ->
    Left = lcs(Xs, B),
    Right = lcs(A, Ys),
    case length(Left) >= length(Right) of
        true -> Left;
        false -> Right
    end.

main() ->
    io:format("~s~n", [lcs("abcde", "ace")]).
