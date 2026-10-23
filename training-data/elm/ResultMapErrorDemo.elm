module ResultMapErrorDemo exposing (parseAge, ParseError(..))


type ParseError
    = NotANumber String
    | OutOfRange Int


parseAge : String -> Result ParseError Int
parseAge input =
    String.toInt input
        |> Result.fromMaybe input
        |> Result.mapError NotANumber
        |> Result.andThen
            (\n ->
                if n < 0 || n > 150 then
                    Err (OutOfRange n)

                else
                    Ok n
            )
