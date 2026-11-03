module PerfectSquareCheck exposing (isPerfectSquare)


isPerfectSquare : Int -> Bool
isPerfectSquare n =
    if n < 0 then
        False

    else
        let
            r =
                round (sqrt (toFloat n))
        in
        r * r == n
