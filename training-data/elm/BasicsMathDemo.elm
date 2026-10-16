module BasicsMathDemo exposing (clampDemo, hypotenuse, roundTo)


hypotenuse : Float -> Float -> Float
hypotenuse a b =
    sqrt (a ^ 2 + b ^ 2)


roundTo : Int -> Float -> Float
roundTo places x =
    let
        factor =
            10 ^ toFloat places
    in
    toFloat (round (x * factor)) / factor


clampDemo : Int -> Int
clampDemo =
    clamp 0 100
