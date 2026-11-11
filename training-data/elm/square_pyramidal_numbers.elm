module SquarePyramidalNumbers exposing (main)

-- Square pyramidal numbers n(n+1)(2n+1)/6

import Html exposing (text)


term : Int -> Int
term n =
    ((n * (n + 1)) * ((2 * n) + 1)) // 6


main =
    text (String.join " " (List.map (term >> String.fromInt) (List.range 0 9)))
