module MatrixTranspose exposing (transpose)


transpose : List (List a) -> List (List a)
transpose rows =
    case rows of
        [] ->
            []

        [] :: _ ->
            []

        _ ->
            List.filterMap List.head rows
                :: transpose (List.filterMap List.tail rows)
