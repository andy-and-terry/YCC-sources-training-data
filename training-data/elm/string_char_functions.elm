module StringCharFunctions exposing (capitalizeWords, isPalindrome, rot13, vowelCount)


capitalizeWords : String -> String
capitalizeWords s =
    s
        |> String.words
        |> List.map (\w -> String.toUpper (String.left 1 w) ++ String.toLower (String.dropLeft 1 w))
        |> String.join " "


isPalindrome : String -> Bool
isPalindrome s =
    let
        cleaned =
            s |> String.toLower |> String.filter Char.isAlphaNum
    in
    cleaned == String.reverse cleaned


vowelCount : String -> Int
vowelCount =
    String.toList >> List.filter (\c -> String.contains (String.fromChar (Char.toLower c)) "aeiou") >> List.length


rot13 : String -> String
rot13 =
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
    Char.fromCode (Char.toCode base + modBy 26 (Char.toCode c - Char.toCode base + 13))
