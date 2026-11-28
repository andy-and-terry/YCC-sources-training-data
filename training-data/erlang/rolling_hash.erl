-module(rolling_hash).
-export([main/0]).

window_hash(S) -> lists:foldl(fun(C, H) -> (H * 31 + C) rem 1000003 end, 0, S).

main() ->
    S = "abcabc",
    [io:format("~p ~p~n", [I, window_hash(lists:sublist(S, I + 1, 3))]) || I <- lists:seq(0, length(S) - 3)].
