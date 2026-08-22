module ListPipelineDemo exposing (evenSquareSum)


evenSquareSum : List Int -> Int
evenSquareSum numbers =
    numbers
        |> List.filter (\n -> modBy 2 n == 0)
        |> List.map (\n -> n * n)
        |> List.sum
