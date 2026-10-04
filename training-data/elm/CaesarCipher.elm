module CaesarCipher exposing (decode, encode)

import Char


shift : Int -> Char -> Char
shift k c =
    if Char.isLower c then
        rotate 'a' k c

    else if Char.isUpper c then
        rotate 'A' k c

    else
        c


rotate : Char -> Int -> Char -> Char
rotate base k c =
    let
        offset =
            modBy 26 (Char.toCode c - Char.toCode base + k)
    in
    Char.fromCode (Char.toCode base + offset)


encode : Int -> String -> String
encode k =
    String.map (shift k)


decode : Int -> String -> String
decode k =
    encode (negate k)
