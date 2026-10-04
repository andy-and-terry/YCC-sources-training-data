module StringFunctionsDemo exposing (initials, shout, titleCase, wordCount)


shout : String -> String
shout text =
    String.toUpper text ++ "!"


wordCount : String -> Int
wordCount text =
    text
        |> String.words
        |> List.length


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
initials text =
    text
        |> String.words
        |> List.filterMap (String.uncons >> Maybe.map (Tuple.first >> Char.toUpper))
        |> String.fromList
