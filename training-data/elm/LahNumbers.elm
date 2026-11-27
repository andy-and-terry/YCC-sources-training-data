module LahNumbers exposing (lah, table)


lah : Int -> Int -> Int
lah n k =
    let
        c =
            List.foldl (\i acc -> acc * (n - 1 - i) // (i + 1)) 1 (List.range 0 (k - 2))

        f =
            List.product (List.range (k + 1) n)
    in
    c * f


table : Int -> List (List Int)
table size =
    List.range 1 size |> List.map (\n -> List.range 1 n |> List.map (lah n))
