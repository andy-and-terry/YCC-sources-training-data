module HappyNumbers exposing (happyNumbers, isHappy)

import Set exposing (Set)


digitSquareSum : Int -> Int
digitSquareSum n =
    if n == 0 then
        0

    else
        modBy 10 n * modBy 10 n + digitSquareSum (n // 10)


isHappy : Int -> Bool
isHappy n =
    isHappyHelp n Set.empty


isHappyHelp : Int -> Set Int -> Bool
isHappyHelp n seen =
    if n == 1 then
        True

    else if Set.member n seen then
        False

    else
        isHappyHelp (digitSquareSum n) (Set.insert n seen)


happyNumbers : Int -> List Int
happyNumbers limit =
    List.filter isHappy (List.range 1 limit)



-- happyNumbers 40 == [1,7,10,13,19,23,28,31,32,44]
