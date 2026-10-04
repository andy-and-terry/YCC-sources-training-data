module CharClassification exposing (classify, countDigits, isVowel)


classify : Char -> String
classify c =
    if Char.isDigit c then
        "digit"

    else if Char.isUpper c then
        "upper"

    else if Char.isLower c then
        "lower"

    else if c == ' ' then
        "space"

    else
        "other"


isVowel : Char -> Bool
isVowel c =
    List.member (Char.toLower c) [ 'a', 'e', 'i', 'o', 'u' ]


countDigits : String -> Int
countDigits text =
    text
        |> String.toList
        |> List.filter Char.isDigit
        |> List.length
