module HeapSort exposing (heapSort)

import Array exposing (Array)


heapSort : List comparable -> List comparable
heapSort items =
    let
        arr =
            Array.fromList items

        n =
            Array.length arr

        heapified =
            List.foldr (\i acc -> siftDown acc n i) arr (List.range 0 (n // 2 - 1))
    in
    Array.toList (sortDown heapified (n - 1))


siftDown : Array comparable -> Int -> Int -> Array comparable
siftDown arr size root =
    let
        left =
            2 * root + 1

        right =
            2 * root + 2

        largest =
            [ root, left, right ]
                |> List.filter (\i -> i < size)
                |> List.foldl
                    (\i best ->
                        case ( Array.get i arr, Array.get best arr ) of
                            ( Just v, Just b ) ->
                                if v > b then
                                    i

                                else
                                    best

                            _ ->
                                best
                    )
                    root
    in
    if largest == root then
        arr

    else
        siftDown (swap root largest arr) size largest


swap : Int -> Int -> Array comparable -> Array comparable
swap i j arr =
    case ( Array.get i arr, Array.get j arr ) of
        ( Just vi, Just vj ) ->
            arr |> Array.set i vj |> Array.set j vi

        _ ->
            arr


sortDown : Array comparable -> Int -> Array comparable
sortDown arr lastIndex =
    if lastIndex <= 0 then
        arr

    else
        let
            swapped =
                swap 0 lastIndex arr
        in
        sortDown (siftDown swapped lastIndex 0) (lastIndex - 1)
