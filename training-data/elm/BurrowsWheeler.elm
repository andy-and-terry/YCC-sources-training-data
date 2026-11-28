module BurrowsWheeler exposing (main)

import Html exposing (text)


bwt : String -> String
bwt s =
    List.range 0 (String.length s - 1)
        |> List.map (\i -> String.dropLeft i s ++ String.left i s)
        |> List.sort
        |> List.map (String.right 1)
        |> String.concat


main =
    text (bwt "banana$")
