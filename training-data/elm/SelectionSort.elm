module SelectionSort exposing (selectionSort)


selectionSort : List comparable -> List comparable
selectionSort items =
    case items of
        [] ->
            []

        _ ->
            let
                minVal =
                    List.minimum items |> Maybe.withDefault 0

                rest =
                    removeFirst minVal items
            in
            minVal :: selectionSort rest


removeFirst : comparable -> List comparable -> List comparable
removeFirst x items =
    case items of
        [] ->
            []

        h :: t ->
            if h == x then
                t

            else
                h :: removeFirst x t
