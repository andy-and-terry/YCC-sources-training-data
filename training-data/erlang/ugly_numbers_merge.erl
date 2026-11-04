-module(ugly_numbers_merge).
-export([main/0, ugly/1]).

ugly(N) -> ugly(N, [1], 1, 1, 1) .

ugly(N, Seq, _, _, _) when length(Seq) >= N -> lists:nth(N, Seq);
ugly(N, Seq, I2, I3, I5) ->
    C2 = lists:nth(I2, Seq) * 2,
    C3 = lists:nth(I3, Seq) * 3,
    C5 = lists:nth(I5, Seq) * 5,
    Next = lists:min([C2, C3, C5]),
    ugly(N, Seq ++ [Next],
         I2 + bool(Next =:= C2), I3 + bool(Next =:= C3), I5 + bool(Next =:= C5)).

bool(true) -> 1;
bool(false) -> 0.

main() ->
    io:format("~p~n", [[ugly(I) || I <- lists:seq(1, 12)]]).
