module Swap exposing (swap, minMax)

swap : ( a, b ) -> ( b, a )
swap ( x, y ) = ( y, x )

minMax : List Int -> Maybe ( Int, Int )
minMax xs =
    case ( List.minimum xs, List.maximum xs ) of
        ( Just a, Just b ) -> Just ( a, b )
        _ -> Nothing
