module Main exposing (main)

import Dict
import Html exposing (text)

main =
    ["a", "bb", "cc", "d"]
        |> List.foldl (\w d -> Dict.update (String.length w) (\v -> Just (w :: Maybe.withDefault [] v)) d) Dict.empty
        |> Dict.toList
        |> Debug.toString
        |> text
