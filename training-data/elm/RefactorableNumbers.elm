module RefactorableNumbers exposing (main)

import Html


tau : Int -> Int
tau n =
    List.range 1 n |> List.filter (\d -> modBy d n == 0) |> List.length


main : Html.Html msg
main =
    List.range 1 59
        |> List.filter (\n -> modBy (tau n) n == 0)
        |> List.map String.fromInt
        |> String.join " "
        |> Html.text



-- 1 2 8 9 12 18 24 36 40 56
