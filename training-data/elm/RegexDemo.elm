module RegexDemo exposing (collapseSpaces, digitsIn, isEmail, redactDigits)

import Regex exposing (Regex)


digitPattern : Regex
digitPattern =
    Maybe.withDefault Regex.never (Regex.fromString "\\d+")


emailPattern : Regex
emailPattern =
    Maybe.withDefault Regex.never (Regex.fromString "^[\\w.]+@[\\w.]+\\.[a-z]{2,}$")


digitsIn : String -> List String
digitsIn text =
    Regex.find digitPattern text
        |> List.map .match


redactDigits : String -> String
redactDigits =
    Regex.replace digitPattern (\m -> String.repeat (String.length m.match) "#")


collapseSpaces : String -> String
collapseSpaces =
    Regex.replace
        (Maybe.withDefault Regex.never (Regex.fromString "\\s+"))
        (\_ -> " ")


isEmail : String -> Bool
isEmail =
    Regex.contains emailPattern
