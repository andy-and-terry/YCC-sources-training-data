module CharClassification exposing (classify)


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
