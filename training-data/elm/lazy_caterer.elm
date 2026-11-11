module LazyCaterer exposing (main)

-- Lazy caterer sequence: max pieces from n cuts

import Html exposing (text)


term : Int -> Int
term n =
    ((n * (n + 1)) // 2) + 1


main =
    text (String.join " " (List.map (term >> String.fromInt) (List.range 0 9)))
