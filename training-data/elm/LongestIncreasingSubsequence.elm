module LongestIncreasingSubsequence exposing (lengthOfLIS)

import Array exposing (Array)


lengthOfLIS : List Int -> Int
lengthOfLIS numbers =
    let
        arr =
            Array.fromList numbers

        n =
            Array.length arr

        dp =
            List.range 0 (n - 1)
                |> List.foldl (updateDp arr) (Array.repeat n 1)
    in
    dp
        |> Array.toList
        |> List.maximum
        |> Maybe.withDefault 0


updateDp : Array Int -> Int -> Array Int -> Array Int
updateDp arr i dp =
    List.range 0 (i - 1)
        |> List.foldl
            (\j acc ->
                case ( Array.get i arr, Array.get j arr, Array.get j acc, Array.get i acc ) of
                    ( Just vi, Just vj, Just dj, Just di ) ->
                        if vj < vi && dj + 1 > di then
                            Array.set i (dj + 1) acc

                        else
                            acc

                    _ ->
                        acc
            )
            dp
