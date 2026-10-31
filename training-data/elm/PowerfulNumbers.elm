module PowerfulNumbers exposing (main)

import Html


isPowerful : Int -> Bool
isPowerful n =
    let
        strip m p =
            if modBy p m == 0 then
                strip (m // p) p

            else
                m

        go m p =
            if p * p > m then
                m == 1

            else if modBy p m == 0 then
                if modBy (p * p) m /= 0 then
                    False

                else
                    go (strip m p) (p + 1)

            else
                go m (p + 1)
    in
    go n 2


main =
    List.range 1 100
        |> List.filter isPowerful
        |> Debug.toString
        |> Html.text
