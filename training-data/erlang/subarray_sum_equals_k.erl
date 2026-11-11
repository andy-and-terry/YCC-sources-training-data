%% Count contiguous subarrays whose sum equals K (prefix sums + map).
-module(subarray_sum_equals_k).
-export([main/0]).

count(Nums, K) ->
    {_, _, Count} = lists:foldl(
        fun(X, {Seen, Total, Acc}) ->
            T = Total + X,
            Acc1 = Acc + maps:get(T - K, Seen, 0),
            {maps:update_with(T, fun(V) -> V + 1 end, 1, Seen), T, Acc1}
        end,
        {#{0 => 1}, 0, 0},
        Nums),
    Count.

main() -> io:format("~p~n", [count([1, 1, 1], 2)]).
