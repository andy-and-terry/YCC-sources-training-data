module Main exposing (main)

import Html exposing (text)


say : Int -> String
say n =
    case ( modBy 3 n, modBy 5 n ) of
        ( 0, 0 ) -> "FizzBuzz"
        ( 0, _ ) -> "Fizz"
        ( _, 0 ) -> "Buzz"
        _ -> String.fromInt n


main =
    text (String.join " " (List.map say (List.range 1 15)))
