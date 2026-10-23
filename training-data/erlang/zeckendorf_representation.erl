-module(zeckendorf_representation).
-export([main/0]).

fibs(A, _B, Limit) when A > Limit -> [];
fibs(A, B, Limit) -> [A | fibs(B, A + B, Limit)].

zeck(0, _) -> [];
zeck(N, [F | Fs]) when F =< N -> [F | zeck(N - F, Fs)];
zeck(N, [_ | Fs]) -> zeck(N, Fs).

main() ->
    Parts = zeck(100, lists:reverse(fibs(1, 2, 100))),
    io:format("~s~n", [lists:flatten(lists:join(" ", [integer_to_list(P) || P <- Parts]))]).
