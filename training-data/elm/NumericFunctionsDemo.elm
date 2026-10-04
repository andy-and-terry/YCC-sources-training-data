module NumericFunctionsDemo exposing (average, hypotenuse, roundTo)


roundTo : Int -> Float -> Float
roundTo places value =
    let
        factor =
            10 ^ toFloat places
    in
    toFloat (round (value * factor)) / factor


hypotenuse : Float -> Float -> Float
hypotenuse a b =
    sqrt (a ^ 2 + b ^ 2)


average : List Float -> Maybe Float
average values =
    if List.isEmpty values then
        Nothing

    else
        Just (List.sum values / toFloat (List.length values))


-- 7 // 2 == 3, -7 // 2 == -3, modBy 3 -7 == 2, remainderBy 3 -7 == -1
-- floor 2.7 == 2, ceiling 2.1 == 3, truncate -2.7 == -2
-- roundTo 2 3.14159 == 3.14
-- hypotenuse 3 4 == 5
