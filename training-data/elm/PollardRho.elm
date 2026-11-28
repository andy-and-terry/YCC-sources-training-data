module PollardRho exposing (main)

import Html exposing (text)


gcd : Int -> Int -> Int
gcd a b =
    if b == 0 then
        a

    else
        gcd b (modBy b a)


rho : Int -> Int
rho n =
    let
        f v =
            modBy n (v * v + 1)

        loop x y =
            let
                x1 = f x
                y1 = f (f y)
                d = gcd (abs (x1 - y1)) n
            in
            if d == 1 then loop x1 y1 else d
    in
    if modBy 2 n == 0 then 2 else loop 2 2


main =
    text (String.fromInt (rho 8051))
