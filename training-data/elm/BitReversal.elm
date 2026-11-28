module BitReversal exposing (reverseBits)

import Bitwise


reverseBits : Int -> Int
reverseBits value =
    List.foldl
        (\i acc ->
            Bitwise.or (Bitwise.shiftLeftBy 1 acc)
                (Bitwise.and (Bitwise.shiftRightBy i value) 1)
        )
        0
        (List.range 0 7)



-- List.map reverseBits [1, 6, 13, 128] == [128, 96, 176, 1]
