module SpiralMatrixTraversal exposing (spiralOrder)


spiralOrder : List (List a) -> List a
spiralOrder matrix =
    case matrix of
        [] ->
            []

        top :: rest ->
            case rest of
                [] ->
                    top

                _ ->
                    top ++ spiralOrder (rotate rest)


rotate : List (List a) -> List (List a)
rotate matrix =
    matrix
        |> transpose
        |> List.reverse


transpose : List (List a) -> List (List a)
transpose matrix =
    case matrix of
        [] ->
            []

        [] :: _ ->
            []

        _ ->
            List.filterMap List.head matrix
                :: transpose (List.map (List.drop 1) matrix)
