-module(repunit_numbers).
-export([main/0]).

%% Repunits: R_n = 11...1 (n ones), built as R_{n-1}*10 + 1.
main() -> loop(1, 0).

loop(N, _) when N > 8 -> ok;
loop(N, R0) ->
    R = R0 * 10 + 1,
    Note = if R rem 3 =:= 0 -> "  (divisible by 3)"; true -> "" end,
    io:format("~p~s~n", [R, Note]),
    loop(N + 1, R).
