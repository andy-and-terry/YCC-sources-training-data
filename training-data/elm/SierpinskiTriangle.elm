module SierpinskiTriangle exposing (main)

import Bitwise
import Html exposing (pre, text)


row : Int -> Int -> String
row n r =
    String.repeat (n - r - 1) " "
        ++ (List.range 0 r
                |> List.map (\c -> if Bitwise.and r c == c then "* " else "  ")
                |> String.concat
           )


main =
    List.range 0 7
        |> List.map (row 8)
        |> String.join "\n"
        |> (\s -> pre [] [ text s ])
