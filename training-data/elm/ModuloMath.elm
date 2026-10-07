module ModuloMath exposing (clampTo, isDivisibleBy, wrapIndex)


wrapIndex : Int -> Int -> Int
wrapIndex length index =
    modBy length index


isDivisibleBy : Int -> Int -> Bool
isDivisibleBy divisor n =
    remainderBy divisor n == 0


clampTo : Int -> Int -> Int -> Int
clampTo low high value =
    clamp low high value



-- wrapIndex 5 -1 == 4, whereas remainderBy 5 -1 == -1
