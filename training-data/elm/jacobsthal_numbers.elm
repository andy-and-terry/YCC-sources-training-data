module Main exposing (main)

-- Jacobsthal numbers: J0=0, J1=1, Jn = J(n-1) + 2*J(n-2)

import Html exposing (text)


jacobsthal : Int -> List Int
jacobsthal count =
    let
        go n a b acc =
            if n == 0 then
                List.reverse acc

            else
                go (n - 1) b (b + 2 * a) (a :: acc)
    in
    go count 0 1 []


main =
    text (String.join " " (List.map String.fromInt (jacobsthal 15)))
