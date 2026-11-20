module AliquotSum exposing (aliquot, kind)

{-| Aliquot sum and classification. -}


aliquot : Int -> Int
aliquot n =
    List.range 1 (n - 1)
        |> List.filter (\d -> modBy d n == 0)
        |> List.sum


kind : Int -> String
kind n =
    case compare (aliquot n) n of
        EQ ->
            "perfect"

        GT ->
            "abundant"

        LT ->
            "deficient"
