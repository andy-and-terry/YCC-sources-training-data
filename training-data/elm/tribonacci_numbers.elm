module TribonacciNumbers exposing (main, tribonacci)

import Html exposing (Html, text)


-- Tribonacci: T0=0, T1=0, T2=1, T(n) = T(n-1) + T(n-2) + T(n-3)


tribonacci : Int -> List Int
tribonacci count =
    let
        go n a b c =
            if n <= 0 then
                []

            else
                a :: go (n - 1) b c (a + b + c)
    in
    go count 0 0 1


main : Html msg
main =
    text ("Tribonacci: " ++ String.join ", " (List.map String.fromInt (tribonacci 15)))
