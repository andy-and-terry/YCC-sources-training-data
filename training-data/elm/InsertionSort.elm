module InsertionSort exposing (insertionSort)


insert : comparable -> List comparable -> List comparable
insert x items =
    case items of
        [] ->
            [ x ]

        h :: t ->
            if x <= h then
                x :: h :: t

            else
                h :: insert x t


insertionSort : List comparable -> List comparable
insertionSort items =
    List.foldl insert [] items
