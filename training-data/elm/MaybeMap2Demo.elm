module MaybeMap2Demo exposing (fullName, parseSum)


fullName : Maybe String -> Maybe String -> Maybe String
fullName first lastName =
    Maybe.map2 (\f l -> f ++ " " ++ l) first lastName


parseSum : String -> String -> Maybe Int
parseSum a b =
    Maybe.map2 (+) (String.toInt a) (String.toInt b)
