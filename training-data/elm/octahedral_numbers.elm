module Main exposing (main)

import Html exposing (text)


-- n(2n^2+1)/3


term : Int -> Int
term n =
    (n * (((2 * n) * n) + 1)) // 3


main =
    List.range 1 15
        |> List.map (\n -> String.fromInt n ++ " -> " ++ String.fromInt (term n))
        |> String.join ", "
        |> text
