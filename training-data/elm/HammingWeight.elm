module HammingWeight exposing (popcount)

import Bitwise


popcount : Int -> Int
popcount n =
    if n == 0 then
        0

    else
        1 + popcount (Bitwise.and n (n - 1))
