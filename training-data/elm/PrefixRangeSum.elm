module PrefixRangeSum exposing (build, query)

import Array exposing (Array)


build : List Int -> Array Int
build values =
    List.foldl (\v ( total, acc ) -> ( total + v, total + v :: acc )) ( 0, [ 0 ] ) values
        |> Tuple.second
        |> List.reverse
        |> Array.fromList


query : Array Int -> Int -> Int -> Int
query prefix lo hi =
    Maybe.withDefault 0 (Array.get hi prefix) - Maybe.withDefault 0 (Array.get lo prefix)
