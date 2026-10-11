module ResultTraverse exposing (parseAll)


parseAll : List String -> Result String (List Int)
parseAll strings =
    List.foldr
        (\s acc ->
            Result.map2 (::) (parseOne s) acc
        )
        (Ok [])
        strings


parseOne : String -> Result String Int
parseOne s =
    case String.toInt s of
        Just n ->
            Ok n

        Nothing ->
            Err ("not an int: " ++ s)
