module FilterMapDemo exposing (parseInts, sumValid, withPositions)


parseInts : List String -> List Int
parseInts =
    List.filterMap String.toInt


sumValid : List String -> Int
sumValid strings =
    strings
        |> parseInts
        |> List.sum


withPositions : List a -> List ( Int, a )
withPositions =
    List.indexedMap Tuple.pair


evenIndexed : List a -> List a
evenIndexed items =
    items
        |> List.indexedMap Tuple.pair
        |> List.filter (\( i, _ ) -> modBy 2 i == 0)
        |> List.map Tuple.second
