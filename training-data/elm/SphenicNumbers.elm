module SphenicNumbers exposing (main)

import Html


isSphenic : Int -> Bool
isSphenic n =
    let
        go m p distinct =
            if p * p > m then
                distinct + (if m > 1 then 1 else 0) == 3

            else if modBy p m == 0 then
                let
                    m2 =
                        m // p
                in
                if modBy p m2 == 0 then
                    False

                else
                    go m2 (p + 1) (distinct + 1)

            else
                go m (p + 1) distinct
    in
    go n 2 0


main =
    List.range 2 79
        |> List.filter isSphenic
        |> Debug.toString
        |> Html.text
