module MunchausenNumbers exposing (isMunchausen, munchausenNumbers)

-- Munchausen numbers: sum of digit^digit equals n (0^0 counted as 0).
-- munchausenNumbers == [ 1, 3435 ]


isMunchausen : Int -> Bool
isMunchausen n =
    String.fromInt n
        |> String.toList
        |> List.map (\c -> Char.toCode c - 48)
        |> List.map (\d -> if d == 0 then 0 else d ^ d)
        |> List.sum
        |> (==) n


munchausenNumbers : List Int
munchausenNumbers =
    List.range 1 4999 |> List.filter isMunchausen
