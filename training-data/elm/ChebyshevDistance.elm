module ChebyshevDistance exposing (chebyshev)


chebyshev : List Int -> List Int -> Int
chebyshev a b =
    List.map2 (\x y -> abs (x - y)) a b
        |> List.maximum
        |> Maybe.withDefault 0
