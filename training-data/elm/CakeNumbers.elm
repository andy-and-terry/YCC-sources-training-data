module CakeNumbers exposing (main)

import Html


cake : Int -> Int
cake n =
    (n * n * n + 5 * n + 6) // 6


main : Html.Html msg
main =
    List.range 0 9
        |> List.map (cake >> String.fromInt)
        |> String.join " "
        |> Html.text



-- 1 2 4 8 15 26 42 64 93 130
