-module(hanoi_move_list).
-export([main/0]).

hanoi(0, _, _, _) -> [];
hanoi(N, A, B, C) -> hanoi(N - 1, A, C, B) ++ [{A, C}] ++ hanoi(N - 1, B, A, C).

main() ->
    M = hanoi(3, a, b, c),
    io:format("~p: ~p~n", [length(M), M]).
