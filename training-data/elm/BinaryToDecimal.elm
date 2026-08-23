module BinaryToDecimal exposing (fromBinary)


fromBinary : String -> Int
fromBinary str =
    str
        |> String.toList
        |> List.foldl (\c acc -> acc * 2 + (Char.toCode c - Char.toCode '0')) 0
