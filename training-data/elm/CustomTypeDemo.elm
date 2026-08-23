module CustomTypeDemo exposing (Shape(..), area, perimeter)


type Shape
    = Circle Float
    | Rectangle Float Float
    | Triangle Float Float Float


area : Shape -> Float
area shape =
    case shape of
        Circle r ->
            pi * r * r

        Rectangle w h ->
            w * h

        Triangle a b c ->
            let
                s =
                    (a + b + c) / 2
            in
            sqrt (s * (s - a) * (s - b) * (s - c))


perimeter : Shape -> Float
perimeter shape =
    case shape of
        Circle r ->
            2 * pi * r

        Rectangle w h ->
            2 * (w + h)

        Triangle a b c ->
            a + b + c
