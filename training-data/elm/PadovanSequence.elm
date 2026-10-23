module PadovanSequence exposing (main, padovan)

import Html exposing (Html, text)


-- Padovan numbers: P(n) = P(n-2) + P(n-3), P(0)=P(1)=P(2)=1


padovan : Int -> List Int
padovan count =
    let
        go n ( a, b, c ) =
            if n == 0 then
                []

            else
                a :: go (n - 1) ( b, c, a + b )
    in
    go count ( 1, 1, 1 )


main : Html msg
main =
    text (String.join " " (List.map String.fromInt (padovan 15)))
