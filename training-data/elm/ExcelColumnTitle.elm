module ExcelColumnTitle exposing (columnTitle)


columnTitle : Int -> String
columnTitle n =
    if n <= 0 then
        ""

    else
        columnTitle ((n - 1) // 26)
            ++ String.fromChar (Char.fromCode (65 + modBy 26 (n - 1)))



-- columnTitle 28 == "AB", columnTitle 701 == "ZY"
