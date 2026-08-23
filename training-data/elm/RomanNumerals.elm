module RomanNumerals exposing (toRoman)


values : List ( Int, String )
values =
    [ ( 1000, "M" )
    , ( 900, "CM" )
    , ( 500, "D" )
    , ( 400, "CD" )
    , ( 100, "C" )
    , ( 90, "XC" )
    , ( 50, "L" )
    , ( 40, "XL" )
    , ( 10, "X" )
    , ( 9, "IX" )
    , ( 5, "V" )
    , ( 4, "IV" )
    , ( 1, "I" )
    ]


toRoman : Int -> String
toRoman n =
    if n <= 0 then
        ""

    else
        case List.filter (\( v, _ ) -> v <= n) values of
            ( value, symbol ) :: _ ->
                symbol ++ toRoman (n - value)

            [] ->
                ""
