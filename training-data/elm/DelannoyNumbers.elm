module DelannoyNumbers exposing (central)


central : Int -> List Int
central count =
    rows count
        |> List.indexedMap (\m row -> row |> List.drop m |> List.head |> Maybe.withDefault 0)


rows : Int -> List (List Int)
rows count =
    List.foldl
        (\_ acc ->
            case acc of
                prev :: _ ->
                    nextRow prev :: acc

                [] ->
                    acc
        )
        [ List.repeat count 1 ]
        (List.range 1 (count - 1))
        |> List.reverse


nextRow : List Int -> List Int
nextRow prev =
    List.map2 Tuple.pair prev (List.drop 1 prev)
        |> List.foldl
            (\( diag, above ) acc ->
                case acc of
                    left :: _ ->
                        (left + diag + above) :: acc

                    [] ->
                        acc
            )
            [ 1 ]
        |> List.reverse



-- central 10 == [1,3,13,63,321,1683,8989,48639,265729,1462563]
