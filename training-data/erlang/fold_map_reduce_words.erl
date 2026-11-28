-module(fold_map_reduce_words).
-export([main/0]).

main() ->
    M = lists:foldl(fun(W, Acc) -> maps:update_with(W, fun(C) -> C + 1 end, 1, Acc) end,
                    #{}, ["a", "b", "a", "a"]),
    io:format("~p~n", [maps:to_list(M)]).
