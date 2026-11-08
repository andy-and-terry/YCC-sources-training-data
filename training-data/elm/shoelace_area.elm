module ShoelaceArea exposing (area)


area : List ( Float, Float ) -> Float
area pts =
    let
        next =
            List.drop 1 pts ++ List.take 1 pts
    in
    List.map2 (\( x1, y1 ) ( x2, y2 ) -> x1 * y2 - x2 * y1) pts next
        |> List.sum
        |> abs
        |> (\s -> s / 2)
