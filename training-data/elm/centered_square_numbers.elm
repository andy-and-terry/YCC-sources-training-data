module CenteredSquareNumbers exposing (main)

-- Centered square numbers 2n(n+1)+1

import Html exposing (text)


term : Int -> Int
term n =
    ((2 * n) * (n + 1)) + 1


main =
    text (String.join " " (List.map (term >> String.fromInt) (List.range 0 9)))
