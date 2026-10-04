module TupleDemo exposing (divMod, swap, withIndex)


divMod : Int -> Int -> ( Int, Int )
divMod a b =
    ( a // b, modBy b a )


swap : ( a, b ) -> ( b, a )
swap ( x, y ) =
    ( y, x )


withIndex : List a -> List ( Int, a )
withIndex items =
    List.indexedMap Tuple.pair items


example : List String
example =
    [ Tuple.first (divMod 17 5) |> String.fromInt
    , Tuple.second (divMod 17 5) |> String.fromInt
    , Tuple.mapFirst String.fromInt ( 1, True ) |> Tuple.first
    , Tuple.mapSecond not ( 1, True ) |> Tuple.second |> Debug.toString
    ]
