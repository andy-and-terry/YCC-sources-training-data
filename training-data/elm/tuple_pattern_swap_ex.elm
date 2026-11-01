module TuplePatternSwapEx exposing (swap, minMax)


swap : ( a, b ) -> ( b, a )
swap ( a, b ) =
    ( b, a )


minMax : List Int -> Maybe ( Int, Int )
minMax xs =
    case xs of
        [] ->
            Nothing

        h :: t ->
            Just (List.foldl (\x ( lo, hi ) -> ( min x lo, max x hi )) ( h, h ) t)
