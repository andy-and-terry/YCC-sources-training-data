module RollingHash exposing (main)

import Html exposing (text)


windowHash : String -> Int
windowHash s =
    String.foldl (\c h -> modBy 1000003 (h * 31 + Char.toCode c)) 0 s


main =
    List.range 0 3
        |> List.map (\i -> String.fromInt (windowHash (String.slice i (i + 3) "abcabc")))
        |> String.join " "
        |> text
