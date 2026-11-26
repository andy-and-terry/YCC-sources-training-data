module Emirps exposing (main)

-- Emirps below 200; expect 15.

import Html exposing (text)


isPrime : Int -> Bool
isPrime n =
    n > 1 && List.all (\d -> modBy d n /= 0) (List.range 2 (floor (sqrt (toFloat n))))


rev : Int -> Int
rev n =
    String.toInt (String.fromList (List.reverse (String.toList (String.fromInt n)))) |> Maybe.withDefault 0



main =
    text (Debug.toString (List.length (List.filter (\n -> rev n /= n && isPrime n && isPrime (rev n)) (List.range 2 199))))
