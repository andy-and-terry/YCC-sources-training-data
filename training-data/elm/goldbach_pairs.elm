module GoldbachPairs exposing (main)

-- Goldbach partitions of 100; expect 6.

import Html exposing (text)


isPrime : Int -> Bool
isPrime n =
    n > 1 && List.all (\d -> modBy d n /= 0) (List.range 2 (floor (sqrt (toFloat n))))



main =
    text (Debug.toString (List.filter (\p -> isPrime p && isPrime (100 - p)) (List.range 2 50) |> List.map (\p -> ( p, 100 - p ))))
