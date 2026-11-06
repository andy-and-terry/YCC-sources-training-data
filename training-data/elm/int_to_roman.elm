module IntToRoman exposing (toRoman)

{-| Integer (1..3999) to Roman numeral using a greedy table. -}


table : List ( Int, String )
table =
    [ ( 1000, "M" ), ( 900, "CM" ), ( 500, "D" ), ( 400, "CD" ), ( 100, "C" ), ( 90, "XC" )
    , ( 50, "L" ), ( 40, "XL" ), ( 10, "X" ), ( 9, "IX" ), ( 5, "V" ), ( 4, "IV" ), ( 1, "I" )
    ]


toRoman : Int -> String
toRoman n =
    List.foldl
        (\( value, symbol ) ( rest, out ) ->
            ( modBy value rest, out ++ String.repeat (rest // value) symbol )
        )
        ( n, "" )
        table
        |> Tuple.second
