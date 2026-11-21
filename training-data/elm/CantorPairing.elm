module CantorPairing exposing (pair, unpair)

-- Cantor pairing function and its inverse.
-- pair 3 4 == 32, unpair 32 == ( 3, 4 )


pair : Int -> Int -> Int
pair x y =
    (x + y) * (x + y + 1) // 2 + y


unpair : Int -> ( Int, Int )
unpair z =
    let
        w =
            (floor (sqrt (toFloat (8 * z + 1))) - 1) // 2

        y =
            z - w * (w + 1) // 2
    in
    ( w - y, y )
