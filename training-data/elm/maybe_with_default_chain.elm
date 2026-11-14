module Main exposing (main)

import Html exposing (text)

parse : String -> Maybe Int
parse =
    String.toInt

main =
    text
        (String.fromInt
            (parse "12" |> Maybe.map (\n -> n * 2) |> Maybe.withDefault 0)
        )
