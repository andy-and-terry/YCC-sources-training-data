module CharClassification exposing (caesarShift, classify, vowelCount)


classify : Char -> String
classify c =
    if Char.isDigit c then
        "digit"

    else if Char.isUpper c then
        "upper"

    else if Char.isLower c then
        "lower"

    else
        "other"


vowelCount : String -> Int
vowelCount text =
    text
        |> String.toLower
        |> String.toList
        |> List.filter (\c -> List.member c [ 'a', 'e', 'i', 'o', 'u' ])
        |> List.length


caesarShift : Int -> String -> String
caesarShift amount =
    String.map
        (\c ->
            if Char.isLower c then
                shift 'a' c

            else if Char.isUpper c then
                shift 'A' c

            else
                c
        )


shift : Char -> Char -> Char
shift base c =
    let
        offset =
            Char.toCode c - Char.toCode base
    in
    Char.fromCode (Char.toCode base + modBy 26 (offset + 3))
