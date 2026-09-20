module NQueens exposing (countSolutions, solve)


solve : Int -> List (List Int)
solve n =
    place n []


place : Int -> List Int -> List (List Int)
place n placed =
    if List.length placed == n then
        [ List.reverse placed ]

    else
        List.range 0 (n - 1)
            |> List.filter (\col -> isSafe col placed)
            |> List.concatMap (\col -> place n (col :: placed))


isSafe : Int -> List Int -> Bool
isSafe col placed =
    placed
        |> List.indexedMap (\row placedCol -> ( row + 1, placedCol ))
        |> List.all
            (\( rowDistance, placedCol ) ->
                placedCol /= col && abs (placedCol - col) /= rowDistance
            )


countSolutions : Int -> Int
countSolutions n =
    List.length (solve n)
