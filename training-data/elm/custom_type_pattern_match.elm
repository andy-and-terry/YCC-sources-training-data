module Main exposing (main)
import Html exposing (text)

type Shape = Circle Float | Rect Float Float

area : Shape -> Float
area s =
    case s of
        Circle r -> pi * r * r
        Rect w h -> w * h

main = text (String.fromFloat (area (Rect 2 3)))
