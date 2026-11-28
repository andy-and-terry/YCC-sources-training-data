module ManhattanDistance exposing (manhattan)


manhattan : List Int -> List Int -> Int
manhattan a b =
    List.map2 (\x y -> abs (x - y)) a b |> List.sum
