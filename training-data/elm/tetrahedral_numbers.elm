module TetrahedralNumbers exposing (main)

-- Tetrahedral numbers n(n+1)(n+2)/6

import Html exposing (text)


term : Int -> Int
term n =
    ((n * (n + 1)) * (n + 2)) // 6


main =
    text (String.join " " (List.map (term >> String.fromInt) (List.range 0 9)))
