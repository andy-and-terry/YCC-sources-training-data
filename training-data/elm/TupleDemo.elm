module TupleDemo exposing (divMod, minMax, swap)


swap : ( a, b ) -> ( b, a )
swap ( x, y ) =
    ( y, x )


divMod : Int -> Int -> ( Int, Int )
divMod a b =
    ( a // b, modBy b a )


minMax : List Int -> Maybe ( Int, Int )
minMax numbers =
    case numbers of
        [] ->
            Nothing

        first :: rest ->
            Just
                (List.foldl
                    (\n ( lo, hi ) -> ( min n lo, max n hi ))
                    ( first, first )
                    rest
                )
