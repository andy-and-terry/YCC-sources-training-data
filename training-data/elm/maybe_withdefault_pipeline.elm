module Main exposing (main)

import Html exposing (text)

parse : String -> Maybe Int
parse =
    String.toInt

main =
    [ "1", "x", "3" ]
        |> List.map (parse >> Maybe.withDefault 0)
        |> List.sum
        |> String.fromInt
        |> text
