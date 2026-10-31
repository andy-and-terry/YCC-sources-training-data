module AlternatingDigitSum exposing (main)

import Html


digits : Int -> List Int
digits n =
    String.fromInt n
        |> String.toList
        |> List.filterMap (\c -> String.toInt (String.fromChar c))


alternatingDigitSum : Int -> Int
alternatingDigitSum n =
    digits n
        |> List.reverse
        |> List.indexedMap (\i d -> if modBy 2 i == 0 then d else -d)
        |> List.sum


main =
    [ 1234, 99999, 1000 ]
        |> List.map alternatingDigitSum
        |> Debug.toString
        |> Html.text
