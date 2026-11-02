module Main exposing (main)

import Html exposing (text)

main =
    let
        ( evens, odds ) = List.partition (\n -> modBy 2 n == 0) (List.range 1 10)
    in
    text (String.fromInt (List.foldl (+) 0 evens) ++ "/" ++ String.fromInt (List.length odds))
