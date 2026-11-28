module ShoelacePolygonArea exposing (area)


area : List ( Float, Float ) -> Float
area pts =
    case pts of
        [] ->
            0

        first :: rest ->
            let
                next =
                    rest ++ [ first ]

                cross ( x1, y1 ) ( x2, y2 ) =
                    x1 * y2 - x2 * y1
            in
            abs (List.sum (List.map2 cross pts next)) / 2
