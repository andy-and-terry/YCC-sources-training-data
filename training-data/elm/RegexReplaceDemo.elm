module RegexReplaceDemo exposing (collapseSpaces, digits, maskDigits)

import Regex


collapseSpaces : String -> String
collapseSpaces =
    Regex.replace (regex "\\s+") (\_ -> " ")


maskDigits : String -> String
maskDigits =
    Regex.replace (regex "[0-9]") (\_ -> "#")


digits : String -> List String
digits s =
    Regex.find (regex "[0-9]+") s
        |> List.map .match


regex : String -> Regex.Regex
regex pattern =
    Regex.fromString pattern
        |> Maybe.withDefault Regex.never
