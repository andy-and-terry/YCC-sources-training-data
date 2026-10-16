module StringWordsDemo exposing (capitalizeWords, countWords, initials)


capitalizeWords : String -> String
capitalizeWords sentence =
    sentence
        |> String.words
        |> List.map capitalize
        |> String.join " "


capitalize : String -> String
capitalize word =
    case String.uncons word of
        Just ( c, rest ) ->
            String.cons (Char.toUpper c) rest

        Nothing ->
            ""


countWords : String -> Int
countWords =
    String.words >> List.length


initials : String -> String
initials name =
    name
        |> String.words
        |> List.filterMap (String.uncons >> Maybe.map (Tuple.first >> Char.toUpper))
        |> String.fromList
