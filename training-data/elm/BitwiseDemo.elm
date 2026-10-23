module BitwiseDemo exposing (isBitSet, popCount, setBit, toggleBit)

import Bitwise


isBitSet : Int -> Int -> Bool
isBitSet n x =
    Bitwise.and x (Bitwise.shiftLeftBy n 1) /= 0


setBit : Int -> Int -> Int
setBit n x =
    Bitwise.or x (Bitwise.shiftLeftBy n 1)


toggleBit : Int -> Int -> Int
toggleBit n x =
    Bitwise.xor x (Bitwise.shiftLeftBy n 1)


popCount : Int -> Int
popCount x =
    if x == 0 then
        0

    else
        (Bitwise.and x 1) + popCount (Bitwise.shiftRightZfBy 1 x)
