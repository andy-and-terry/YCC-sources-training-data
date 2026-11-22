module EulerZigzagNumbers exposing (zigzag)

-- Euler zigzag numbers via the Seidel-Entringer boustrophedon.
-- zigzag 10 == [ 1, 1, 1, 2, 5, 16, 61, 272, 1385, 7936 ]


step : List Int -> List Int
step row =
    List.reverse row
        |> List.foldl
            (\x acc ->
                case acc of
                    h :: _ ->
                        (h + x) :: acc

                    [] ->
                        [ x ]
            )
            [ 0 ]
        |> List.reverse


lastOf : List Int -> Int
lastOf xs =
    List.reverse xs |> List.head |> Maybe.withDefault 0


zigzag : Int -> List Int
zigzag count =
    let
        go k row acc =
            if k == 0 then
                List.reverse acc

            else
                go (k - 1) (step row) (lastOf row :: acc)
    in
    go count [ 1 ] []
