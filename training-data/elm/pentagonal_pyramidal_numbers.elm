module Main exposing (main)

import Html exposing (text)


-- n^2(n+1)/2


term : Int -> Int
term n =
    ((n * n) * (n + 1)) // 2


main =
    List.range 1 15
        |> List.map (\n -> String.fromInt n ++ " -> " ++ String.fromInt (term n))
        |> String.join ", "
        |> text
