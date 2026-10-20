module ResultMaybeAndThenChain exposing (parseAge, parseUser, validate)


parseAge : String -> Result String Int
parseAge s =
    String.toInt s
        |> Result.fromMaybe ("not a number: " ++ s)
        |> Result.andThen
            (\n ->
                if n < 0 then
                    Err "negative"

                else if n > 150 then
                    Err "too old"

                else
                    Ok n
            )


validate : String -> Maybe String
validate name =
    if String.isEmpty (String.trim name) then
        Nothing

    else
        Just (String.trim name)


parseUser : String -> String -> Result String ( String, Int )
parseUser name age =
    Result.map2 Tuple.pair
        (validate name |> Result.fromMaybe "empty name")
        (parseAge age)
