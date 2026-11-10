module Emirps exposing (main)

import Html


isPrime : Int -> Bool
isPrime n =
    n >= 2 && List.all (\d -> modBy d n /= 0) (List.range 2 (floor (sqrt (toFloat n))))


reverseNum : Int -> Int
reverseNum n =
    String.fromInt n |> String.reverse |> String.toInt |> Maybe.withDefault 0


emirps : List Int
emirps =
    List.range 2 120
        |> List.filter (\n -> reverseNum n /= n && isPrime n && isPrime (reverseNum n))
        |> List.take 10


main : Html.Html msg
main =
    Html.text (String.join " " (List.map String.fromInt emirps))



-- 13 17 31 37 71 73 79 97 107 113
