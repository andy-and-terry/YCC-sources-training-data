module TupleDemo exposing (minMax, swap)


swap : ( a, b ) -> ( b, a )
swap ( a, b ) =
    ( b, a )


minMax : List Int -> Maybe ( Int, Int )
minMax list =
    case list of
        [] ->
            Nothing

        x :: xs ->
            Just (List.foldl (\n ( lo, hi ) -> ( min lo n, max hi n )) ( x, x ) xs)


mapBoth : (a -> x) -> (b -> y) -> ( a, b ) -> ( x, y )
mapBoth f g =
    Tuple.mapBoth f g


pairs : List ( Int, String )
pairs =
    List.map2 Tuple.pair [ 1, 2, 3 ] [ "a", "b", "c" ]
