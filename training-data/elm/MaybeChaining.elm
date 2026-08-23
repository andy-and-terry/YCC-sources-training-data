module MaybeChaining exposing (safeDivide, safeDivideChain)


safeDivide : Float -> Float -> Maybe Float
safeDivide numerator denominator =
    if denominator == 0 then
        Nothing

    else
        Just (numerator / denominator)


safeDivideChain : Float -> Float -> Float -> Maybe Float
safeDivideChain a b c =
    safeDivide a b
        |> Maybe.andThen (\result -> safeDivide result c)
