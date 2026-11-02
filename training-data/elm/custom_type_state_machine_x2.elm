module Main exposing (main)

import Html exposing (text)

type Light = Red | Green | Yellow

next : Light -> Light
next l =
    case l of
        Red -> Green
        Green -> Yellow
        Yellow -> Red

main =
    text (Debug.toString (next (next Red)))
