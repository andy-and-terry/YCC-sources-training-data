module SelfDescribingNumbers exposing (main)

import Html


isSelfDescribing : Int -> Bool
isSelfDescribing n =
    let
        ds =
            String.fromInt n
                |> String.toList
                |> List.filterMap (\c -> String.toInt (String.fromChar c))
    in
    ds
        |> List.indexedMap (\i d -> List.length (List.filter ((==) i) ds) == d)
        |> List.all identity


main =
    [ 1210, 2020, 21200, 1211 ]
        |> List.map isSelfDescribing
        |> Debug.toString
        |> Html.text
