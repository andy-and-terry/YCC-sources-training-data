module Main exposing (main)

import Html exposing (text)


-- n(n+1)(n+2)/6


term : Int -> Int
term n =
    ((n * (n + 1)) * (n + 2)) // 6


main =
    List.range 1 15
        |> List.map (\n -> String.fromInt n ++ " -> " ++ String.fromInt (term n))
        |> String.join ", "
        |> text
