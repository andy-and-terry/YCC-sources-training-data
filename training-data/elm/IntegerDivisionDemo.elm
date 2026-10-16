module IntegerDivisionDemo exposing (divMod, floorDivNeg)


divMod : Int -> Int -> ( Int, Int )
divMod a b =
    ( a // b, remainderBy b a )


floorDivNeg : Int -> Int -> Int
floorDivNeg a b =
    floor (toFloat a / toFloat b)
