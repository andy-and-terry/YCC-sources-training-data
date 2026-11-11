module PopcountTable exposing (main)

-- Population count (number of set bits) for 0..15

import Bitwise
import Html exposing (text)


bits : Int -> Int
bits n =
    if n == 0 then
        0

    else
        Bitwise.and n 1 + bits (Bitwise.shiftRightBy 1 n)


main =
    text (String.join " " (List.map (bits >> String.fromInt) (List.range 0 15)))
