module PascalTriangle exposing (pascal)


nextRow : List Int -> List Int
nextRow row =
    List.map2 (+) (0 :: row) (row ++ [ 0 ])


pascal : Int -> List (List Int)
pascal n =
    List.foldl
        (\_ rows ->
            case List.reverse rows of
                last :: _ ->
                    rows ++ [ nextRow last ]

                [] ->
                    [ [ 1 ] ]
        )
        []
        (List.range 1 n)
