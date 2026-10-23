module ListMaximumMinimumDemo exposing (range, safeMax, safeMin)


safeMax : List Int -> Int
safeMax xs =
    List.maximum xs |> Maybe.withDefault 0


safeMin : List Int -> Int
safeMin xs =
    List.minimum xs |> Maybe.withDefault 0


range : List Int -> Maybe Int
range xs =
    Maybe.map2 (-) (List.maximum xs) (List.minimum xs)



-- safeMax [ 3, 9, 2 ] == 9
-- safeMax [] == 0
-- range [ 3, 9, 2 ] == Just 7
-- range [] == Nothing
