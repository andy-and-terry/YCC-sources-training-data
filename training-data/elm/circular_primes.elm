module CircularPrimes exposing (main)

-- Circular primes below 100; expect 13.

import Html exposing (text)


isPrime : Int -> Bool
isPrime n =
    n > 1 && List.all (\d -> modBy d n /= 0) (List.range 2 (floor (sqrt (toFloat n))))


circular : Int -> Bool
circular n =
    let
        s =
            String.fromInt n
    in
    List.all
        (\i -> isPrime (String.toInt (String.dropLeft i s ++ String.left i s) |> Maybe.withDefault 0))
        (List.range 0 (String.length s - 1))



main =
    text (Debug.toString (List.length (List.filter circular (List.range 2 99))))
