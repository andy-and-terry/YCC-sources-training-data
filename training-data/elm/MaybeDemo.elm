module MaybeDemo exposing (safeDivide)


safeDivide : Int -> Int -> Maybe Int
safeDivide a b =
    if b == 0 then
        Nothing

    else
        Just (a // b)


sumMaybes : List (Maybe Int) -> Int
sumMaybes values =
    values
        |> List.filterMap identity
        |> List.sum
