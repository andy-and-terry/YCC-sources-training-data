-module(shell_sort).
-export([sort/1]).

sort(List) ->
    Arr = list_to_tuple(List),
    N = tuple_size(Arr),
    Gaps = gaps(N div 2),
    Sorted = lists:foldl(fun(Gap, Acc) -> gap_pass(Acc, N, Gap) end, Arr, Gaps),
    tuple_to_list(Sorted).

gaps(Gap) when Gap =< 0 -> [];
gaps(Gap) -> [Gap | gaps(Gap div 2)].

gap_pass(Arr, N, Gap) ->
    lists:foldl(fun(I, Acc) -> insert_at_gap(Acc, Gap, I) end, Arr, lists:seq(Gap + 1, N)).

insert_at_gap(Arr, Gap, I) ->
    Temp = element(I, Arr),
    shift_back(Arr, Gap, I, Temp).

shift_back(Arr, Gap, J, Temp) when J > Gap ->
    Prev = element(J - Gap, Arr),
    case Prev > Temp of
        true ->
            Arr1 = setelement(J, Arr, Prev),
            shift_back(Arr1, Gap, J - Gap, Temp);
        false ->
            setelement(J, Arr, Temp)
    end;
shift_back(Arr, _Gap, J, Temp) ->
    setelement(J, Arr, Temp).

main() ->
    io:format("~p~n", [sort([5, 2, 9, 1, 5, 6])]).
