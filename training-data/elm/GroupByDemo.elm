module GroupByDemo exposing (groupByRemainder, partitionEvenOdd)

import Dict exposing (Dict)


groupByRemainder : Int -> List Int -> Dict Int (List Int)
groupByRemainder divisor numbers =
    List.foldl
        (\n acc ->
            Dict.update (modBy divisor n)
                (\existing -> Just (n :: Maybe.withDefault [] existing))
                acc
        )
        Dict.empty
        numbers


partitionEvenOdd : List Int -> ( List Int, List Int )
partitionEvenOdd numbers =
    List.partition (\n -> modBy 2 n == 0) numbers
