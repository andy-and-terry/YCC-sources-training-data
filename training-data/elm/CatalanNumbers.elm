module CatalanNumbers exposing (catalan)

import Array exposing (Array)


catalan : Int -> List Int
catalan n =
    let
        base =
            Array.set 0 1 (Array.repeat (n + 1) 0)

        filled =
            List.foldl fillIndex base (List.range 1 n)
    in
    Array.toList filled


fillIndex : Int -> Array Int -> Array Int
fillIndex i arr =
    let
        total =
            List.range 0 (i - 1)
                |> List.map (\j -> get j arr * get (i - 1 - j) arr)
                |> List.sum
    in
    Array.set i total arr


get : Int -> Array Int -> Int
get i arr =
    Maybe.withDefault 0 (Array.get i arr)
