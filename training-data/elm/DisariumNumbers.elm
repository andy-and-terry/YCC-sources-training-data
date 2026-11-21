module DisariumNumbers exposing (disariumNumbers, isDisarium)

-- Disarium numbers: digits raised to their 1-based positions sum to n.
-- disariumNumbers == [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 89, 135, 175, 518, 598 ]


isDisarium : Int -> Bool
isDisarium n =
    String.fromInt n
        |> String.toList
        |> List.indexedMap (\i c -> (Char.toCode c - 48) ^ (i + 1))
        |> List.sum
        |> (==) n


disariumNumbers : List Int
disariumNumbers =
    List.range 1 999 |> List.filter isDisarium
