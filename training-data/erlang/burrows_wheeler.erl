-module(burrows_wheeler).
-export([main/0]).

bwt(S) ->
    N = length(S),
    Rots = [lists:nthtail(I, S) ++ lists:sublist(S, I) || I <- lists:seq(0, N - 1)],
    [lists:last(R) || R <- lists:sort(Rots)].

main() -> io:format("~s~n", [bwt("banana$")]).
