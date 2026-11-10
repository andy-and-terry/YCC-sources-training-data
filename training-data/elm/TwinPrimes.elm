module TwinPrimes exposing (main)

import Html


isPrime : Int -> Bool
isPrime n =
    n >= 2 && List.all (\d -> modBy d n /= 0) (List.range 2 (floor (sqrt (toFloat n))))


pairs : List ( Int, Int )
pairs =
    List.range 3 78
        |> List.filter (\p -> isPrime p && isPrime (p + 2))
        |> List.map (\p -> ( p, p + 2 ))


main : Html.Html msg
main =
    Html.text (String.join " " (List.map (\( a, b ) -> "(" ++ String.fromInt a ++ "," ++ String.fromInt b ++ ")") pairs))



-- (3,5) (5,7) (11,13) (17,19) (29,31) (41,43) (59,61) (71,73)
