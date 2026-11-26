module DeficientNumbers exposing (main)

-- Deficient numbers below 100; expect 76.

import Html exposing (text)


properSum : Int -> Int
properSum n =
    List.range 1 (n - 1)
        |> List.filter (\d -> modBy d n == 0)
        |> List.sum



main =
    text (Debug.toString (List.length (List.filter (\n -> properSum n < n) (List.range 1 99))))
