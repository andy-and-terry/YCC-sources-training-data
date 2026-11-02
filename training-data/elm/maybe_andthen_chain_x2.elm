module Main exposing (main)

import Html exposing (text)

safeDiv : Int -> Int -> Maybe Int
safeDiv a b =
    if b == 0 then Nothing else Just (a // b)

main =
    text (Debug.toString (Just 100 |> Maybe.andThen (safeDiv 50) |> Maybe.andThen (safeDiv 10)))
