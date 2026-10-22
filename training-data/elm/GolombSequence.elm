module GolombSequence exposing (golomb)

import Array exposing (Array)


at : Int -> Array Int -> Int
at i terms =
    Array.get (i - 1) terms |> Maybe.withDefault 0


golomb : Int -> List Int
golomb count =
    let
        step n terms =
            Array.push (1 + at (n - at (at (n - 1) terms) terms) terms) terms
    in
    List.foldl step (Array.fromList [ 1 ]) (List.range 2 count)
        |> Array.toList



-- golomb 20 == [1,2,2,3,3,4,4,4,5,5,5,6,6,6,6,7,7,7,7,8]
