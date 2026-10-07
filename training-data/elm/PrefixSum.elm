module PrefixSum exposing (prefixSums, rangeSum)

import Array exposing (Array)


prefixSums : List Int -> Array Int
prefixSums list =
    list
        |> List.foldl
            (\x acc ->
                let
                    last =
                        Array.get (Array.length acc - 1) acc |> Maybe.withDefault 0
                in
                Array.push (last + x) acc
            )
            (Array.fromList [ 0 ])


rangeSum : Int -> Int -> Array Int -> Maybe Int
rangeSum lo hi prefix =
    Maybe.map2 (-) (Array.get (hi + 1) prefix) (Array.get lo prefix)
