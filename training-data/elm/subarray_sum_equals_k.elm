module SubarraySumEqualsK exposing (countSubarrays)

{-| Count contiguous subarrays whose sum equals k (prefix sums + Dict). -}

import Dict exposing (Dict)


countSubarrays : List Int -> Int -> Int
countSubarrays nums k =
    let
        step x ( seen, total, count ) =
            let
                t =
                    total + x

                hits =
                    Dict.get (t - k) seen |> Maybe.withDefault 0
            in
            ( Dict.update t (\v -> Just (Maybe.withDefault 0 v + 1)) seen
            , t
            , count + hits
            )

        ( _, _, result ) =
            List.foldl step ( Dict.singleton 0 1, 0, 0 ) nums
    in
    result
