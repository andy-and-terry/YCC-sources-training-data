-module(delta_encoding).
-export([main/0]).

encode([H | T] = L) -> [H | lists:zipwith(fun(A, B) -> B - A end, L, T)].
decode(Ds) -> tl(lists:reverse(lists:foldl(fun(D, [A | _] = Acc) -> [A + D | Acc] end, [0], Ds))).

main() ->
    D = encode([10, 12, 15, 15, 20]),
    io:format("~p~n~p~n", [D, lists:reverse(lists:reverse(decode(D)))]).
