module Main exposing (main)

import Html exposing (text)


-- 2n(n-1)+1


term : Int -> Int
term n =
    ((2 * n) * (n - 1)) + 1


main =
    List.range 1 15
        |> List.map (\n -> String.fromInt n ++ " -> " ++ String.fromInt (term n))
        |> String.join ", "
        |> text
