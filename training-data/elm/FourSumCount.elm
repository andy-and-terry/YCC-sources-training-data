module FourSumCount exposing (fourSumCount)

import Dict exposing (Dict)


fourSumCount : List Int -> List Int -> List Int -> List Int -> Int
fourSumCount a b c d =
    let
        bump key =
            Dict.update key (\v -> Just (Maybe.withDefault 0 v + 1))

        sums : Dict Int Int
        sums =
            List.concatMap (\x -> List.map (\y -> x + y) b) a
                |> List.foldl bump Dict.empty
    in
    List.concatMap (\x -> List.map (\y -> x + y) d) c
        |> List.map (\s -> Dict.get -s sums |> Maybe.withDefault 0)
        |> List.sum



-- fourSumCount [ 1, 2 ] [ -2, -1 ] [ -1, 2 ] [ 0, 2 ] == 2
