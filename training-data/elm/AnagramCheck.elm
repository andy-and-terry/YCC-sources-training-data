module AnagramCheck exposing (isAnagram)


normalize : String -> List Char
normalize str =
    str
        |> String.toLower
        |> String.filter (\c -> c /= ' ')
        |> String.toList
        |> List.sort


isAnagram : String -> String -> Bool
isAnagram a b =
    normalize a == normalize b
