module SuperperfectNumbers exposing (main)

import Html


sigma : Int -> Int
sigma n =
    List.range 1 n |> List.filter (\d -> modBy d n == 0) |> List.sum


main : Html.Html msg
main =
    List.range 1 99
        |> List.filter (\n -> sigma (sigma n) == 2 * n)
        |> List.map String.fromInt
        |> String.join " "
        |> Html.text



-- 2 4 16 64
