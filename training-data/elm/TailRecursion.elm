module TailRecursion exposing (factorial, sumRange)


factorial : Int -> Int
factorial n =
    factorialHelp n 1


factorialHelp : Int -> Int -> Int
factorialHelp n acc =
    if n <= 1 then
        acc

    else
        factorialHelp (n - 1) (acc * n)


sumRange : Int -> Int -> Int
sumRange from to =
    sumRangeHelp from to 0


sumRangeHelp : Int -> Int -> Int -> Int
sumRangeHelp from to acc =
    if from > to then
        acc

    else
        sumRangeHelp (from + 1) to (acc + from)
