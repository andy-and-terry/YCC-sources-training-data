module ListMinMaxDemo exposing (spread, average)


spread : List Int -> Maybe Int
spread nums =
    Maybe.map2 (-) (List.maximum nums) (List.minimum nums)


average : List Float -> Maybe Float
average nums =
    if List.isEmpty nums then
        Nothing

    else
        Just (List.sum nums / toFloat (List.length nums))
