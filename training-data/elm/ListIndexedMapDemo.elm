module ListIndexedMapDemo exposing (labeled, positionsOf)


labeled : List String -> List String
labeled items =
    List.indexedMap (\i item -> String.fromInt (i + 1) ++ ". " ++ item) items


positionsOf : a -> List a -> List Int
positionsOf target items =
    items
        |> List.indexedMap Tuple.pair
        |> List.filter (\( _, x ) -> x == target)
        |> List.map Tuple.first



-- labeled [ "a", "b" ] == [ "1. a", "2. b" ]
-- positionsOf 2 [ 2, 5, 2 ] == [ 0, 2 ]
