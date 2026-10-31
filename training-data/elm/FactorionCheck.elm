module FactorionCheck exposing (main)

import Html


factorial : Int -> Int
factorial k =
    List.product (List.range 1 k)


isFactorion : Int -> Bool
isFactorion n =
    let
        total =
            String.fromInt n
                |> String.toList
                |> List.filterMap (\c -> String.toInt (String.fromChar c))
                |> List.map factorial
                |> List.sum
    in
    total == n


main =
    List.range 1 49999
        |> List.filter isFactorion
        |> Debug.toString
        |> Html.text
