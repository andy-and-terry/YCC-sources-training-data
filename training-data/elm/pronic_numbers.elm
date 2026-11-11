module PronicNumbers exposing (main)

-- Pronic numbers n(n+1)

import Html exposing (text)


term : Int -> Int
term n =
    n * (n + 1)


main =
    text (String.join " " (List.map (term >> String.fromInt) (List.range 0 9)))
