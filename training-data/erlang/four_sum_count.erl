-module(four_sum_count).
-export([run/0, count/4]).

count(A, B, C, D) ->
    Sums = lists:foldl(
        fun(S, M) -> maps:update_with(S, fun(V) -> V + 1 end, 1, M) end,
        #{},
        [X + Y || X <- A, Y <- B]
    ),
    lists:sum([maps:get(-(X + Y), Sums, 0) || X <- C, Y <- D]).

run() ->
    io:format("~p~n", [count([1, 2], [-2, -1], [-1, 2], [0, 2])]).
