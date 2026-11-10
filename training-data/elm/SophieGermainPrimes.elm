module SophieGermainPrimes exposing (main)

import Html


isPrime : Int -> Bool
isPrime n =
    n >= 2 && List.all (\d -> modBy d n /= 0) (List.range 2 (floor (sqrt (toFloat n))))


sophieGermain : List Int
sophieGermain =
    List.range 2 100
        |> List.filter (\p -> isPrime p && isPrime (2 * p + 1))
        |> List.take 10


main : Html.Html msg
main =
    Html.text (String.join " " (List.map String.fromInt sophieGermain))



-- 2 3 5 11 23 29 41 53 83 89
