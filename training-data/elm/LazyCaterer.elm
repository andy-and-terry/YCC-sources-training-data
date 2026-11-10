module LazyCaterer exposing (main)

import Html


pieces : Int -> Int
pieces cuts =
    (cuts * cuts + cuts + 2) // 2


main : Html.Html msg
main =
    List.range 0 9
        |> List.map (pieces >> String.fromInt)
        |> String.join " "
        |> Html.text



-- 1 2 4 7 11 16 22 29 37 46
