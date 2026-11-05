module Main exposing (main)

import Html exposing (text)


parseAge : String -> Result String Int
parseAge s =
    String.toInt s
        |> Result.fromMaybe "not a number"
        |> Result.andThen (\n -> if n < 0 then Err "negative" else Ok n)


main =
    text (Debug.toString (List.map parseAge [ "30", "-2", "x" ]))
