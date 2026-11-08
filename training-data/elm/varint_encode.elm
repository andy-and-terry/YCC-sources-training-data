module VarintEncode exposing (varint)

import Bitwise


varint : Int -> List Int
varint n =
    if n < 128 then
        [ n ]

    else
        Bitwise.or (Bitwise.and n 127) 128 :: varint (Bitwise.shiftRightBy 7 n)
