module Main exposing (main)
import Dict
import Html exposing (text)

main =
    Dict.empty
        |> Dict.insert "a" 1
        |> Dict.update "a" (Maybe.map ((+) 10))
        |> Dict.foldl (\k v acc -> acc ++ k ++ String.fromInt v) ""
        |> text
