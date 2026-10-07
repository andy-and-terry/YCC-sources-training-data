module StringFunctionsDemo exposing (initials, isBlank, titleCase, wordCount)


titleCase : String -> String
titleCase text =
    text
        |> String.words
        |> List.map capitalize
        |> String.join " "


capitalize : String -> String
capitalize word =
    case String.uncons word of
        Just ( first, rest ) ->
            String.cons (Char.toUpper first) (String.toLower rest)

        Nothing ->
            ""


initials : String -> String
initials name =
    name
        |> String.words
        |> List.filterMap (String.uncons >> Maybe.map (Tuple.first >> Char.toUpper))
        |> String.fromList


wordCount : String -> Int
wordCount text =
    text |> String.words |> List.length


isBlank : String -> Bool
isBlank text =
    String.trim text |> String.isEmpty
