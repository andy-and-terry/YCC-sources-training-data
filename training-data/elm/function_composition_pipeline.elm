module Main exposing (main)

import Html exposing (text)


shout : String -> String
shout =
    String.trim >> String.toUpper >> (\s -> s ++ "!")


main =
    text (shout "  hello ")
