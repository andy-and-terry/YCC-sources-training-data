module Main exposing (main)

import Html exposing (text)


main =
    let
        ( evens, odds ) =
            List.partition (\n -> modBy 2 n == 0) (List.range 1 8)

        pairs =
            List.map2 Tuple.pair evens odds
    in
    text (Debug.toString ( pairs, List.unzip pairs ))
