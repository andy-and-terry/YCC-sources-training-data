module BeadSort exposing (beadSort)

{-| Bead (gravity) sort. -}


beadSort : List Int -> List Int
beadSort nums =
    let
        count p l =
            List.length (List.filter p l)

        cols =
            List.range 1 (Maybe.withDefault 0 (List.maximum nums))
                |> List.map (\i -> count (\n -> n >= i) nums)
    in
    List.range 1 (List.length nums)
        |> List.map (\r -> count (\c -> c >= r) cols)
        |> List.reverse
