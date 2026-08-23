module IterativeBinarySearch exposing (search)

import Array exposing (Array)


search : List comparable -> comparable -> Bool
search sortedItems target =
    let
        arr =
            Array.fromList sortedItems
    in
    go arr 0 (Array.length arr - 1) target


go : Array comparable -> Int -> Int -> comparable -> Bool
go arr low high target =
    if low > high then
        False

    else
        let
            mid =
                (low + high) // 2
        in
        case Array.get mid arr of
            Just value ->
                if value == target then
                    True

                else if value < target then
                    go arr (mid + 1) high target

                else
                    go arr low (mid - 1) target

            Nothing ->
                False
