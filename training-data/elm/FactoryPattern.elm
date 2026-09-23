module FactoryPattern exposing (Shape(..), area, makeShape)


type Shape
    = Circle Float
    | Square Float
    | UnknownShape


makeShape : String -> Float -> Shape
makeShape kind size =
    case kind of
        "circle" ->
            Circle size

        "square" ->
            Square size

        _ ->
            UnknownShape


area : Shape -> Maybe Float
area shape =
    case shape of
        Circle radius ->
            Just (pi * radius * radius)

        Square side ->
            Just (side * side)

        UnknownShape ->
            Nothing
