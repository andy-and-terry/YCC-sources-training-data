module Main exposing (main)

import Html exposing (text)

safeDiv : Int -> Int -> Maybe Int
safeDiv a b =
    if b == 0 then Nothing else Just (a // b)

main =
    safeDiv 20 4
        |> Maybe.andThen (safeDiv 100)
        |> Maybe.withDefault -1
        |> String.fromInt
        |> text
