module ListPipelineEx exposing (evensSquared)


evensSquared : List Int -> List Int
evensSquared xs =
    xs
        |> List.filter (\x -> modBy 2 x == 0)
        |> List.map (\x -> x * x)
        |> List.sort
