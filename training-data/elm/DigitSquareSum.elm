module DigitSquareSum exposing (digitSquareSum)


digitSquareSum : Int -> Int
digitSquareSum n =
    String.fromInt (abs n)
        |> String.toList
        |> List.filterMap (\c -> String.toInt (String.fromChar c))
        |> List.map (\d -> d * d)
        |> List.sum
