module CharShiftDemo exposing (rot13)


rot13 : String -> String
rot13 =
    String.map shift


shift : Char -> Char
shift c =
    if Char.isLower c then
        rotate 'a' c

    else if Char.isUpper c then
        rotate 'A' c

    else
        c


rotate : Char -> Char -> Char
rotate base c =
    Char.toCode c
        - Char.toCode base
        |> (+) 13
        |> modBy 26
        |> (+) (Char.toCode base)
        |> Char.fromCode
