module FibbinaryNumbers exposing (fibbinary, isFibbinary)

import Bitwise

-- Fibbinary numbers: no two adjacent 1 bits.
-- fibbinary == [0,1,2,4,5,8,9,10,16,17,18,20,21,32,33,34,36,37,40,41,42]


isFibbinary : Int -> Bool
isFibbinary n =
    Bitwise.and n (Bitwise.shiftRightBy 1 n) == 0


fibbinary : List Int
fibbinary =
    List.filter isFibbinary (List.range 0 49)
