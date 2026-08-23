module PipelineOperators exposing (processNumbers)


processNumbers : List Int -> List Int
processNumbers numbers =
    numbers
        |> List.filter (\n -> modBy 2 n == 0)
        |> List.map (\n -> n * n)
        |> List.sortBy negate
