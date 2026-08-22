module BinarySearch exposing (binarySearch)

import Array exposing (Array)


binarySearch : Array comparable -> comparable -> Maybe Int
binarySearch arr target =
    let
        go low high =
            if low > high then
                Nothing

            else
                let
                    mid =
                        (low + high) // 2
                in
                case Array.get mid arr of
                    Nothing ->
                        Nothing

                    Just value ->
                        if value == target then
                            Just mid

                        else if value < target then
                            go (mid + 1) high

                        else
                            go low (mid - 1)
    in
    go 0 (Array.length arr - 1)
