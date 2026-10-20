module CustomTypesCaseMaybe exposing (Shape(..), area, describe, safeDivide)


type Shape
    = Circle Float
    | Rect Float Float
    | Triangle Float Float Float


area : Shape -> Float
area shape =
    case shape of
        Circle r ->
            pi * r * r

        Rect w h ->
            w * h

        Triangle a b c ->
            let
                s =
                    (a + b + c) / 2
            in
            sqrt (s * (s - a) * (s - b) * (s - c))


describe : Maybe Shape -> String
describe maybeShape =
    case maybeShape of
        Nothing ->
            "no shape"

        Just (Circle _) ->
            "a circle"

        Just shape ->
            "area " ++ String.fromFloat (area shape)


safeDivide : Int -> Int -> Result String Int
safeDivide a b =
    if b == 0 then
        Err "division by zero"

    else
        Ok (a // b)
