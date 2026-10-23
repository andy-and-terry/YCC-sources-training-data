module ModByRemainderByDemo exposing (isEven, wrapIndex, clockAdd, signedRemainder)

-- modBy follows the divisor's sign (true modulo);
-- remainderBy follows the dividend's sign (like % in C).


isEven : Int -> Bool
isEven n =
    modBy 2 n == 0


wrapIndex : Int -> Int -> Int
wrapIndex size i =
    modBy size i


clockAdd : Int -> Int -> Int
clockAdd hour delta =
    modBy 12 (hour + delta)


signedRemainder : Int -> Int -> Int
signedRemainder divisor n =
    remainderBy divisor n



-- modBy 5 -3          == 2
-- remainderBy 5 -3    == -3
-- wrapIndex 4 -1      == 3
-- clockAdd 11 3       == 2
-- clamp 0 10 15       == 10
