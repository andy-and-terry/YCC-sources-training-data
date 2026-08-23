module ResultChaining exposing (parseAndDouble)


parseAndDouble : String -> Result String Int
parseAndDouble str =
    String.toInt str
        |> Result.fromMaybe ("could not parse: " ++ str)
        |> Result.map (\n -> n * 2)
