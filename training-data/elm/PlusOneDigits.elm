module PlusOneDigits exposing (plusOne)


plusOne : List Int -> List Int
plusOne digits =
    let
        step d ( carry, acc ) =
            let
                s =
                    d + carry
            in
            ( s // 10, modBy 10 s :: acc )

        ( finalCarry, out ) =
            List.foldr step ( 1, [] ) digits
    in
    if finalCarry > 0 then
        finalCarry :: out

    else
        out



-- plusOne [ 1, 2, 9 ] == [ 1, 3, 0 ]
-- plusOne [ 9, 9 ] == [ 1, 0, 0 ]
