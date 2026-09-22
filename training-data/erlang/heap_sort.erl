-module(heap_sort).
-export([sort/1]).

sort([]) -> [];
sort([X]) -> [X];
sort(List) ->
    Arr = list_to_tuple(List),
    N = tuple_size(Arr),
    Heap = build_heap(Arr, N),
    heap_sort_loop(Heap, N).

build_heap(Arr, N) ->
    lists:foldl(
        fun(I, Acc) -> sift_down(Acc, N, I) end,
        Arr,
        lists:seq(N div 2, 1, -1)
    ).

heap_sort_loop(Arr, 1) ->
    tuple_to_list(Arr);
heap_sort_loop(Arr, Size) ->
    Arr1 = swap(Arr, 1, Size),
    Arr2 = sift_down(Arr1, Size - 1, 1),
    heap_sort_loop(Arr2, Size - 1).

sift_down(Arr, Size, Root) ->
    Left = 2 * Root,
    Right = 2 * Root + 1,
    Largest = largest_of(Arr, Size, Root, Left, Right),
    case Largest =:= Root of
        true -> Arr;
        false -> sift_down(swap(Arr, Root, Largest), Size, Largest)
    end.

largest_of(Arr, Size, Root, Left, Right) ->
    L1 = case Left =< Size andalso element(Left, Arr) > element(Root, Arr) of
        true -> Left;
        false -> Root
    end,
    case Right =< Size andalso element(Right, Arr) > element(L1, Arr) of
        true -> Right;
        false -> L1
    end.

swap(Arr, I, J) ->
    Vi = element(I, Arr),
    Vj = element(J, Arr),
    Arr1 = setelement(I, Arr, Vj),
    setelement(J, Arr1, Vi).

main() ->
    io:format("~p~n", [sort([5, 2, 9, 1, 5, 6])]).
