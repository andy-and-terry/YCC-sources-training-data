module RepunitNumbers exposing (repunits)

{-| Repunits: numbers made only of the digit 1. -}


repunits : Int -> List Int
repunits count =
    List.scanl (\_ r -> r * 10 + 1) 0 (List.range 1 count)
        |> List.drop 1
