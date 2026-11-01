module MianChowlaSequence exposing (firstEight)

{-| Greedy sequence whose pairwise sums are all distinct.
-}

import Set exposing (Set)


build : Int -> List Int -> Set Int -> Int -> List Int
build count seq sums cand =
    if List.length seq >= count then
        seq

    else
        let
            fresh =
                List.map (\x -> x + cand) (seq ++ [ cand ])

            freshSet =
                Set.fromList fresh
        in
        if Set.size freshSet == List.length fresh && Set.isEmpty (Set.intersect freshSet sums) then
            build count (seq ++ [ cand ]) (Set.union sums freshSet) (cand + 1)

        else
            build count seq sums (cand + 1)


firstEight : List Int
firstEight =
    build 8 [] Set.empty 1



-- firstEight == [ 1, 2, 4, 8, 13, 21, 31, 45 ]
