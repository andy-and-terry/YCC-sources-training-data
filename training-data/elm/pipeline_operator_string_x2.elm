module Main exposing (main)

import Html exposing (text)

main =
    "  Hello Elm  "
        |> String.trim
        |> String.toUpper
        |> String.words
        |> String.join "_"
        |> text
