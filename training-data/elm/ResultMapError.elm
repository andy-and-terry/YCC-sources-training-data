module ResultMapError exposing (parseAge)


type AgeError
    = NotANumber String
    | OutOfRange Int


parseAge : String -> Result AgeError Int
parseAge input =
    String.toInt input
        |> Result.fromMaybe (NotANumber input)
        |> Result.andThen
            (\n ->
                if n < 0 || n > 150 then
                    Err (OutOfRange n)

                else
                    Ok n
            )
