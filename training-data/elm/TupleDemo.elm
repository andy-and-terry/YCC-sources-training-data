module TupleDemo exposing (divMod, minMax, swap)


swap : ( a, b ) -> ( b, a )
swap ( x, y ) =
    ( y, x )


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


divMod : Int -> Int -> ( Int, Int )
divMod a b =
    ( a // b, modBy b a )


mapBoth : (a -> x) -> (b -> y) -> ( a, b ) -> ( x, y )
mapBoth f g ( a, b ) =
    ( f a, g b )
