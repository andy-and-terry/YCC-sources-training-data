module ArmstrongNumbers exposing (armstrongNumbers, isArmstrong)


digits : Int -> List Int
digits n =
    String.toList (String.fromInt n)
        |> List.filterMap (\c -> String.toInt (String.fromChar c))


isArmstrong : Int -> Bool
isArmstrong n =
    let
        ds =
            digits n

        len =
            List.length ds
    in
    List.sum (List.map (\d -> d ^ len) ds) == n


armstrongNumbers : Int -> List Int
armstrongNumbers limit =
    List.filter isArmstrong (List.range 1 limit)



-- armstrongNumbers 999 == [1,2,3,4,5,6,7,8,9,153,370,371,407]
