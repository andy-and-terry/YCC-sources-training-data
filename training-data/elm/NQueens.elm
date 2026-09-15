module NQueens exposing (solve)


solve : Int -> List (List Int)
solve n =
    place n []


place : Int -> List Int -> List (List Int)
place n queens =
    if List.length queens == n then
        [ List.reverse queens ]

    else
        List.range 0 (n - 1)
            |> List.filter (isSafe queens)
            |> List.concatMap (\col -> place n (col :: queens))


isSafe : List Int -> Int -> Bool
isSafe queens col =
    queens
        |> List.indexedMap (\i q -> ( i + 1, q ))
        |> List.all (\( dist, q ) -> q /= col && abs (q - col) /= dist)
