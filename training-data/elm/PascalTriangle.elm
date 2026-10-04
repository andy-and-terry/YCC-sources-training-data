module PascalTriangle exposing (nextRow, rows)


nextRow : List Int -> List Int
nextRow row =
    List.map2 (+) (0 :: row) (row ++ [ 0 ])


rows : Int -> List (List Int)
rows n =
    List.foldl
        (\_ acc ->
            case List.reverse acc of
                last :: _ ->
                    acc ++ [ nextRow last ]

                [] ->
                    [ [ 1 ] ]
        )
        []
        (List.range 1 n)
