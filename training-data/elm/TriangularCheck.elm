module TriangularCheck exposing (isTriangular, triangulars)

{-| n is triangular iff 8n + 1 is a perfect square.
-}


isTriangular : Int -> Bool
isTriangular n =
    let
        s =
            8 * n + 1

        r =
            round (sqrt (toFloat s))
    in
    r * r == s


triangulars : List Int
triangulars =
    List.filter isTriangular (List.range 0 20)



-- triangulars == [ 0, 1, 3, 6, 10, 15 ]
