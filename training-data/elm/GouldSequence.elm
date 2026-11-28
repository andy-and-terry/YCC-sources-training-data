module GouldSequence exposing (gould)


popcount : Int -> Int
popcount n =
    if n == 0 then
        0

    else
        modBy 2 n + popcount (n // 2)


gould : Int -> Int
gould n =
    2 ^ popcount n
