module SumSquareDifference exposing (main)

-- Square of the sum minus sum of squares for 1..10 (expect 2640)

import Html exposing (text)


main =
    let
        xs =
            List.range 1 10

        total =
            List.sum xs

        squares =
            List.sum (List.map (\x -> x * x) xs)
    in
    text (String.fromInt (total * total - squares))
