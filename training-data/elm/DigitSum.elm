module DigitSum exposing (digitSum)


digitSum : Int -> Int
digitSum n =
    if n < 10 then
        n

    else
        modBy 10 n + digitSum (n // 10)
