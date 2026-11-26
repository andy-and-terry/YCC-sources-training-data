module PrimorialNumbers exposing (main)

-- Primorials up to 1e6, including 1; expect 8.

import Html exposing (text)


isPrime : Int -> Bool
isPrime n =
    n > 1 && List.all (\d -> modBy d n /= 0) (List.range 2 (floor (sqrt (toFloat n))))


primorials : Int -> Int -> List Int
primorials p acc =
    if not (isPrime p) then
        primorials (p + 1) acc

    else if acc * p > 1000000 then
        []

    else
        (acc * p) :: primorials (p + 1) (acc * p)



main =
    text (Debug.toString (1 :: primorials 2 1))
