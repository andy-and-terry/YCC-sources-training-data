module ToeplitzCheck exposing (isToeplitz)


isToeplitz : List (List Int) -> Bool
isToeplitz rows =
    List.map2
        (\prev cur -> List.drop 1 cur == List.take (List.length cur - 1) prev)
        rows
        (List.drop 1 rows)
        |> List.all identity
