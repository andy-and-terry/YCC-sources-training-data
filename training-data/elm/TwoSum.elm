module TwoSum exposing (twoSum)

import Dict exposing (Dict)


twoSum : List Int -> Int -> Maybe ( Int, Int )
twoSum items target =
    go (List.indexedMap Tuple.pair items) target Dict.empty


go : List ( Int, Int ) -> Int -> Dict Int Int -> Maybe ( Int, Int )
go items target seen =
    case items of
        [] ->
            Nothing

        ( idx, n ) :: rest ->
            case Dict.get (target - n) seen of
                Just j ->
                    Just ( j, idx )

                Nothing ->
                    go rest target (Dict.insert n idx seen)
