module GrayCode exposing (fromGray, graySequence, toGray)

import Bitwise


toGray : Int -> Int
toGray n =
    Bitwise.xor n (Bitwise.shiftRightBy 1 n)


fromGray : Int -> Int
fromGray g =
    fromGrayHelp g 0


fromGrayHelp : Int -> Int -> Int
fromGrayHelp g acc =
    if g == 0 then
        acc

    else
        fromGrayHelp (Bitwise.shiftRightBy 1 g) (Bitwise.xor acc g)


graySequence : Int -> List Int
graySequence bits =
    List.range 0 (2 ^ bits - 1)
        |> List.map toGray
