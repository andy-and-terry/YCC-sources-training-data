module Main exposing (main)

import Html exposing (text)

parseAge : String -> Result String Int
parseAge s =
    String.toInt s |> Result.fromMaybe "not a number"

main =
    text (Debug.toString (Result.map2 (+) (parseAge "3") (parseAge "4")))
