module TupleMapDemo exposing (normalize, swapPair)


swapPair : ( a, b ) -> ( b, a )
swapPair ( a, b ) =
    ( b, a )


normalize : ( String, Int ) -> ( String, String )
normalize pair =
    pair
        |> Tuple.mapFirst String.toUpper
        |> Tuple.mapSecond String.fromInt
