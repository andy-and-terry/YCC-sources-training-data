module MandelbrotAscii exposing (main)

import Html exposing (pre, text)


escape : Float -> Float -> Int
escape cr ci =
    let
        go zr zi n =
            if n == 30 || zr * zr + zi * zi >= 4 then
                n

            else
                go (zr * zr - zi * zi + cr) (2 * zr * zi + ci) (n + 1)
    in
    go 0 0 0


main =
    List.range -5 5
        |> List.map
            (\yi ->
                List.range -40 12
                    |> List.map (\xi -> if escape (toFloat xi / 20) (toFloat yi / 5) == 30 then "#" else ".")
                    |> String.concat
            )
        |> String.join "\n"
        |> (\s -> pre [] [ text s ])
