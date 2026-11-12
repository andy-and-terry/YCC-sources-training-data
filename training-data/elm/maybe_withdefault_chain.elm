module Main exposing (main)
import Html exposing (text)

parse : String -> Maybe Int
parse = String.toInt

main =
    text (String.fromInt (Maybe.withDefault 0 (Maybe.map (\n -> n * 2) (parse "21"))))
