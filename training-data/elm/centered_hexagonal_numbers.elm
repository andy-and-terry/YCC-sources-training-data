module Main exposing (main)

import Html exposing (text)


-- 3n(n-1)+1


term : Int -> Int
term n =
    ((3 * n) * (n - 1)) + 1


main =
    List.range 1 15
        |> List.map (\n -> String.fromInt n ++ " -> " ++ String.fromInt (term n))
        |> String.join ", "
        |> text
