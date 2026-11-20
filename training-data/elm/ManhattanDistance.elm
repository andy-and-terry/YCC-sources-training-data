module ManhattanDistance exposing (manhattan)

{-| Manhattan distance of two vectors. -}


manhattan : List Int -> List Int -> Int
manhattan a b =
    List.sum (List.map2 (\x y -> abs (x - y)) a b)
