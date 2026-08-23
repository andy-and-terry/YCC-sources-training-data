module PalindromeCheck exposing (isPalindrome)


isPalindrome : String -> Bool
isPalindrome str =
    let
        normalized =
            str
                |> String.toLower
                |> String.filter Char.isAlphaNum
    in
    normalized == String.reverse normalized
