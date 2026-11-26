module SexyPrimes exposing (main)

-- Sexy primes below 100; expect 16 pairs.

import Html exposing (text)


isPrime : Int -> Bool
isPrime n =
    n > 1 && List.all (\d -> modBy d n /= 0) (List.range 2 (floor (sqrt (toFloat n))))



main =
    text (Debug.toString (List.length (List.filter (\p -> isPrime p && isPrime (p + 6)) (List.range 2 99))))
