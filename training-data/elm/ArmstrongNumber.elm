module ArmstrongNumber exposing (isArmstrong)


digits : Int -> List Int
digits n =
    if n < 10 then
        [ n ]

    else
        digits (n // 10) ++ [ modBy 10 n ]


isArmstrong : Int -> Bool
isArmstrong n =
    let
        ds =
            digits n

        power =
            List.length ds
    in
    List.sum (List.map (\d -> d ^ power) ds) == n
