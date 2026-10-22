module HofstadterQSequence exposing (hofstadterQ)

import Array exposing (Array)


at : Int -> Array Int -> Int
at i terms =
    Array.get (i - 1) terms |> Maybe.withDefault 0


hofstadterQ : Int -> List Int
hofstadterQ count =
    let
        step n terms =
            Array.push
                (at (n - at (n - 1) terms) terms + at (n - at (n - 2) terms) terms)
                terms
    in
    List.foldl step (Array.fromList [ 1, 1 ]) (List.range 3 count)
        |> Array.toList



-- hofstadterQ 20 == [1,1,2,3,3,4,5,5,6,6,6,8,8,8,10,9,10,11,11,12]
