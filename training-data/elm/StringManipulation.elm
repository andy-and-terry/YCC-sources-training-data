module StringManipulation exposing (capitalize, reverseWords, titleCase)


capitalize : String -> String
capitalize str =
    case String.uncons str of
        Nothing ->
            str

        Just ( first, rest ) ->
            String.cons (Char.toUpper first) rest


titleCase : String -> String
titleCase str =
    str
        |> String.words
        |> List.map capitalize
        |> String.join " "


reverseWords : String -> String
reverseWords str =
    str
        |> String.words
        |> List.reverse
        |> String.join " "
