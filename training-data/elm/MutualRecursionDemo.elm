module MutualRecursionDemo exposing (isEven, isOdd)


isEven : Int -> Bool
isEven n =
    if n == 0 then
        True

    else
        isOdd (abs n - 1)


isOdd : Int -> Bool
isOdd n =
    if n == 0 then
        False

    else
        isEven (abs n - 1)
