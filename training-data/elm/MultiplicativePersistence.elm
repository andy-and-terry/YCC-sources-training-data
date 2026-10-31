module MultiplicativePersistence exposing (main)

import Html


digitProduct : Int -> Int
digitProduct n =
    String.fromInt n
        |> String.toList
        |> List.filterMap (\c -> String.toInt (String.fromChar c))
        |> List.product


persistence : Int -> Int
persistence n =
    if n < 10 then
        0

    else
        1 + persistence (digitProduct n)


main =
    [ 39, 77, 999, 10 ]
        |> List.map persistence
        |> Debug.toString
        |> Html.text
