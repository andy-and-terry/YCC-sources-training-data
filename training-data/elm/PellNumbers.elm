module PellNumbers exposing (pell)

import Html exposing (Html, text)


{-| First `count` Pell numbers: P(n) = 2*P(n-1) + P(n-2)
-}
pell : Int -> List Int
pell count =
    let
        go n a b =
            if n <= 0 then
                []

            else
                a :: go (n - 1) b (2 * b + a)
    in
    go count 0 1


main : Html msg
main =
    text (String.join ", " (List.map String.fromInt (pell 15)))
