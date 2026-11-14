module Main exposing (main)

import Html exposing (text)

validate : Int -> Result String Int
validate n =
    if n < 0 then Err "negative" else Ok n

main =
    text (Debug.toString (Ok 5 |> Result.andThen validate |> Result.andThen (\x -> validate (x - 10))))
