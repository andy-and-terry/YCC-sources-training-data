module MatrixOperations exposing (multiply, transpose)


transpose : List (List a) -> List (List a)
transpose matrix =
    case matrix of
        [] ->
            []

        [] :: _ ->
            []

        _ ->
            List.map (List.head >> Maybe.withDefault (unsafeHead matrix)) matrix
                :: transpose (List.map (List.drop 1) matrix)


unsafeHead : List (List a) -> a
unsafeHead matrix =
    case List.concat matrix of
        h :: _ ->
            h

        [] ->
            Debug.todo "empty matrix"


multiply : List (List Int) -> List (List Int) -> List (List Int)
multiply a b =
    let
        bt =
            transpose b
    in
    List.map
        (\row ->
            List.map
                (\col -> List.map2 (*) row col |> List.sum)
                bt
        )
        a
