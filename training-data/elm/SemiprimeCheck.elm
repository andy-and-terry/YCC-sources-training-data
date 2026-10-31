module SemiprimeCheck exposing (main)

import Html


primeFactorCount : Int -> Int
primeFactorCount n =
    let
        go m p count =
            if p * p > m then
                if m > 1 then count + 1 else count

            else if modBy p m == 0 then
                go (m // p) p (count + 1)

            else
                go m (p + 1) count
    in
    go n 2 0


main =
    List.range 2 29
        |> List.filter (\n -> primeFactorCount n == 2)
        |> Debug.toString
        |> Html.text
