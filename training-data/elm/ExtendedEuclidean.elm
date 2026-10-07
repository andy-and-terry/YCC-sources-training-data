module ExtendedEuclidean exposing (extendedGcd)


extendedGcd : Int -> Int -> ( Int, Int, Int )
extendedGcd a b =
    if b == 0 then
        ( a, 1, 0 )

    else
        let
            ( g, x1, y1 ) =
                extendedGcd b (remainderBy b a)
        in
        ( g, y1, x1 - (a // b) * y1 )
