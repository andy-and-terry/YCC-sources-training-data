module CullenNumbers exposing (main)

import Html


cullen : Int -> Int
cullen n =
    n * 2 ^ n + 1


main =
    List.range 1 5
        |> List.map cullen
        |> Debug.toString
        |> Html.text
