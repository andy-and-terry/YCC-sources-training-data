module Main exposing (main)

import Html exposing (text)


safeDiv : Int -> Int -> Maybe Int
safeDiv a b =
    if b == 0 then Nothing else Just (a // b)


main =
    text (Debug.toString (safeDiv 100 5 |> Maybe.andThen (safeDiv 60)))
