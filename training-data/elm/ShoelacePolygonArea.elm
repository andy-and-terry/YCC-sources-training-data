module ShoelacePolygonArea exposing (area)

{-| Shoelace polygon area. -}


area : List ( Float, Float ) -> Float
area pts =
    let
        next =
            List.drop 1 pts ++ List.take 1 pts

        cross ( x1, y1 ) ( x2, y2 ) =
            x1 * y2 - x2 * y1
    in
    abs (List.sum (List.map2 cross pts next)) / 2
