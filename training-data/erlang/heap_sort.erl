-module(heap_sort).
-export([sort/1]).

sort(List) ->
    N = length(List),
    Heap = build_heap(List, array:new(N)),
    extract_all(Heap, N).

build_heap(List, Heap) ->
    lists:foldl(
        fun({Index, Value}, Acc) ->
            sift_up(array:set(Index, Value, Acc), Index)
        end,
        Heap,
        lists:zip(lists:seq(0, length(List) - 1), List)
    ).

sift_up(Heap, 0) -> Heap;
sift_up(Heap, Index) ->
    Parent = (Index - 1) div 2,
    Val = array:get(Index, Heap),
    ParentVal = array:get(Parent, Heap),
    case Val < ParentVal of
        true ->
            Heap1 = array:set(Index, ParentVal, Heap),
            Heap2 = array:set(Parent, Val, Heap1),
            sift_up(Heap2, Parent);
        false ->
            Heap
    end.

extract_all(_Heap, 0) -> [];
extract_all(Heap, Size) ->
    Min = array:get(0, Heap),
    Last = array:get(Size - 1, Heap),
    Heap1 = array:set(0, Last, Heap),
    Heap2 = sift_down(Heap1, 0, Size - 1),
    [Min | extract_all(Heap2, Size - 1)].

sift_down(Heap, Index, Size) ->
    Left = 2 * Index + 1,
    Right = 2 * Index + 2,
    Smallest = smallest_of(Heap, Size, Index, Left, Right),
    case Smallest =:= Index of
        true -> Heap;
        false ->
            Val = array:get(Index, Heap),
            SmallVal = array:get(Smallest, Heap),
            Heap1 = array:set(Index, SmallVal, Heap),
            Heap2 = array:set(Smallest, Val, Heap1),
            sift_down(Heap2, Smallest, Size)
    end.

smallest_of(Heap, Size, Index, Left, Right) ->
    S1 = case Left < Size andalso array:get(Left, Heap) < array:get(Index, Heap) of
        true -> Left;
        false -> Index
    end,
    case Right < Size andalso array:get(Right, Heap) < array:get(S1, Heap) of
        true -> Right;
        false -> S1
    end.
