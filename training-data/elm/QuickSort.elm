module QuickSort exposing (quicksort)


quicksort : List comparable -> List comparable
quicksort items =
    case items of
        [] ->
            []

        pivot :: rest ->
            let
                smaller =
                    List.filter (\x -> x < pivot) rest

                larger =
                    List.filter (\x -> x >= pivot) rest
            in
            quicksort smaller ++ [ pivot ] ++ quicksort larger
