-module(radix_sort).
-export([sort/1]).

sort([]) -> [];
sort(List) ->
    Max = lists:max(List),
    do_sort(List, 1, Max).

do_sort(List, Exp, Max) when Exp > Max -> List;
do_sort(List, Exp, Max) ->
    Sorted = bucket_by_digit(List, Exp),
    do_sort(Sorted, Exp * 10, Max).

bucket_by_digit(List, Exp) ->
    Buckets = lists:foldl(
        fun(N, Acc) ->
            Digit = (N div Exp) rem 10,
            maps:update_with(Digit, fun(Bucket) -> Bucket ++ [N] end, [N], Acc)
        end,
        #{},
        List
    ),
    lists:append([maps:get(D, Buckets, []) || D <- lists:seq(0, 9)]).

main() ->
    io:format("~p~n", [sort([170, 45, 75, 90, 802, 24, 2, 66])]).
