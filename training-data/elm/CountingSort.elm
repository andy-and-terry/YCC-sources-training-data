module CountingSort exposing (countingSort)

import Array exposing (Array)


countingSort : List Int -> List Int
countingSort items =
    case items of
        [] ->
            []

        _ ->
            let
                maxVal =
                    List.foldl max 0 items

                counts =
                    List.foldl
                        (\v acc ->
                            let
                                current =
                                    Array.get v acc |> Maybe.withDefault 0
                            in
                            Array.set v (current + 1) acc
                        )
                        (Array.repeat (maxVal + 1) 0)
                        items
            in
            counts
                |> Array.toIndexedList
                |> List.concatMap (\( value, count ) -> List.repeat count value)
