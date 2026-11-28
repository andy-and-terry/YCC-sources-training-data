-module(sqrt_decomposition).
-export([main/0]).

query(A, Blk, Bs, I, R, Acc) when I > R -> Acc;
query(A, Blk, Bs, I, R, Acc) when I rem Bs =:= 0, I + Bs - 1 =< R ->
    query(A, Blk, Bs, I + Bs, R, Acc + element(I div Bs + 1, Blk));
query(A, Blk, Bs, I, R, Acc) ->
    query(A, Blk, Bs, I + 1, R, Acc + element(I + 1, A)).

main() ->
    L = [5, 3, 8, 1, 9, 2, 7, 4, 6, 0, 3, 5],
    Blk = list_to_tuple([lists:sum(lists:sublist(L, B * 4 + 1, 4)) || B <- lists:seq(0, 2)]),
    io:format("~p~n", [query(list_to_tuple(L), Blk, 4, 2, 9, 0)]).
