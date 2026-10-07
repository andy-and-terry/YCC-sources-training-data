module BitManipulation exposing (countSetBits, isBitSet, toggleBit)

import Bitwise


countSetBits : Int -> Int
countSetBits n =
    if n == 0 then
        0

    else
        modBy 2 n + countSetBits (Bitwise.shiftRightZfBy 1 n)


isBitSet : Int -> Int -> Bool
isBitSet position n =
    Bitwise.and n (Bitwise.shiftLeftBy position 1) /= 0


toggleBit : Int -> Int -> Int
toggleBit position n =
    Bitwise.xor n (Bitwise.shiftLeftBy position 1)
