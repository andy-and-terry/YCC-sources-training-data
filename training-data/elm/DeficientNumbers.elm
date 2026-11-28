module DeficientNumbers exposing (deficientUpTo)


sigma : Int -> Int
sigma n =
    List.range 1 n |> List.filter (\d -> modBy d n == 0) |> List.sum


deficientUpTo : Int -> List Int
deficientUpTo limit =
    List.range 1 limit |> List.filter (\n -> sigma n < 2 * n)
