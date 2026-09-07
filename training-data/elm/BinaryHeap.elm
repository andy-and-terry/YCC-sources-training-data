module BinaryHeap exposing (Heap, empty, extractMin, insert)

import Array exposing (Array)


type alias Heap =
    Array Int


empty : Heap
empty =
    Array.empty


insert : Int -> Heap -> Heap
insert value heap =
    let
        heap1 =
            Array.push value heap
    in
    siftUp (Array.length heap1 - 1) heap1


siftUp : Int -> Heap -> Heap
siftUp i heap =
    if i <= 0 then
        heap

    else
        let
            parent =
                (i - 1) // 2
        in
        case ( Array.get i heap, Array.get parent heap ) of
            ( Just v, Just p ) ->
                if v < p then
                    siftUp parent (swap i parent heap)

                else
                    heap

            _ ->
                heap


swap : Int -> Int -> Heap -> Heap
swap i j heap =
    case ( Array.get i heap, Array.get j heap ) of
        ( Just vi, Just vj ) ->
            heap |> Array.set i vj |> Array.set j vi

        _ ->
            heap


extractMin : Heap -> Maybe ( Int, Heap )
extractMin heap =
    case Array.get 0 heap of
        Nothing ->
            Nothing

        Just root ->
            let
                lastIndex =
                    Array.length heap - 1
            in
            case Array.get lastIndex heap of
                Nothing ->
                    Nothing

                Just lastValue ->
                    let
                        heap1 =
                            heap
                                |> Array.set 0 lastValue
                                |> Array.slice 0 lastIndex
                    in
                    Just ( root, siftDown 0 heap1 )


siftDown : Int -> Heap -> Heap
siftDown i heap =
    let
        n =
            Array.length heap

        left =
            2 * i + 1

        right =
            2 * i + 2

        smallest =
            [ i, left, right ]
                |> List.filter (\idx -> idx < n)
                |> List.foldl
                    (\idx best ->
                        case ( Array.get idx heap, Array.get best heap ) of
                            ( Just v, Just b ) ->
                                if v < b then
                                    idx

                                else
                                    best

                            _ ->
                                best
                    )
                    i
    in
    if smallest == i then
        heap

    else
        siftDown smallest (swap i smallest heap)
