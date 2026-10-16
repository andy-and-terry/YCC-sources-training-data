module ListAllAnyDemo exposing (allPositive, containsNegative, isSorted)


allPositive : List Int -> Bool
allPositive =
    List.all (\n -> n > 0)


containsNegative : List Int -> Bool
containsNegative =
    List.any (\n -> n < 0)


isSorted : List comparable -> Bool
isSorted list =
    List.map2 (<=) list (List.drop 1 list)
        |> List.all identity
