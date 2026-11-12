module Main exposing (main)
import Html exposing (text)

main =
    let
        ( evens, odds ) = List.partition (\n -> modBy 2 n == 0) (List.range 1 10)
    in
    text (String.join "," (List.map String.fromInt (List.sortBy negate evens ++ odds)))
