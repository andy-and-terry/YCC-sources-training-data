-module(bubble_sort).
-export([sort/1]).

sort(List) ->
    sort(List, length(List)).

sort(List, 0) -> List;
sort(List, N) ->
    {NewList, _} = pass(List),
    sort(NewList, N - 1).

pass([A, B | Rest]) when A > B ->
    {Sorted, Changed} = pass([A | Rest]),
    {[B | Sorted], Changed};
pass([A, B | Rest]) ->
    {Sorted, Changed} = pass([B | Rest]),
    {[A | Sorted], Changed};
pass(List) ->
    {List, false}.

main() ->
    io:format("~p~n", [sort([5, 2, 9, 1, 5, 6])]).
