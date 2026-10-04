module StringPadding exposing (formatRow, table)


formatRow : String -> Int -> String
formatRow label amount =
    String.padRight 10 '.' label ++ String.padLeft 6 ' ' (String.fromInt amount)


table : List ( String, Int ) -> String
table rows =
    rows
        |> List.map (\( l, a ) -> formatRow l a)
        |> String.join "\n"


zeroPad : Int -> Int -> String
zeroPad width n =
    String.padLeft width '0' (String.fromInt n)


truncate : Int -> String -> String
truncate max s =
    if String.length s <= max then
        s

    else
        String.left (max - 3) s ++ "..."
