module MaybeMap2Demo exposing (fullName, safeDivide, sumInputs)


fullName : Maybe String -> Maybe String -> Maybe String
fullName first last =
    Maybe.map2 (\f l -> f ++ " " ++ l) first last


safeDivide : Int -> Int -> Maybe Int
safeDivide a b =
    if b == 0 then
        Nothing

    else
        Just (a // b)


sumInputs : String -> String -> Maybe Int
sumInputs a b =
    Maybe.map2 (+) (String.toInt a) (String.toInt b)
