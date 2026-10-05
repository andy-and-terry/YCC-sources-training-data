module CaesarCipher exposing (decrypt, encrypt)


shiftChar : Int -> Char -> Char
shiftChar amount ch =
    if Char.isUpper ch then
        rotate 'A' amount ch

    else if Char.isLower ch then
        rotate 'a' amount ch

    else
        ch


rotate : Char -> Int -> Char -> Char
rotate base amount ch =
    let
        offset =
            Char.toCode ch - Char.toCode base
    in
    Char.fromCode (Char.toCode base + modBy 26 (offset + amount))


encrypt : Int -> String -> String
encrypt amount =
    String.map (shiftChar amount)


decrypt : Int -> String -> String
decrypt amount =
    encrypt (negate amount)
