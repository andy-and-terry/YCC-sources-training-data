module Main exposing (main)
import Html exposing (text)

main =
    [ 3, 1, 2 ]
        |> List.sort
        |> List.map (\n -> ( n, n * n ))
        |> List.map (\( a, b ) -> String.fromInt a ++ ":" ++ String.fromInt b)
        |> String.join " "
        |> text
