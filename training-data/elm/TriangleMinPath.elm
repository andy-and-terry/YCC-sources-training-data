module TriangleMinPath exposing (minimumTotal)


minimumTotal : List (List Int) -> Int
minimumTotal triangle =
    case List.reverse triangle of
        [] ->
            0

        bottom :: rest ->
            List.foldl step bottom rest
                |> List.head
                |> Maybe.withDefault 0


step : List Int -> List Int -> List Int
step row below =
    List.map3 (\v l r -> v + min l r) row below (List.drop 1 below)



-- minimumTotal [ [ 2 ], [ 3, 4 ], [ 6, 5, 7 ], [ 4, 1, 8, 3 ] ] == 11
