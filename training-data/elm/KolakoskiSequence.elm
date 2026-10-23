module KolakoskiSequence exposing (kolakoski)


kolakoski : Int -> List Int
kolakoski count =
    let
        grow i terms =
            if List.length terms >= count then
                terms

            else
                let
                    run =
                        List.head (List.drop i terms) |> Maybe.withDefault 1

                    last =
                        List.head (List.reverse terms) |> Maybe.withDefault 1
                in
                grow (i + 1) (terms ++ List.repeat run (3 - last))
    in
    List.take count (grow 2 [ 1, 2, 2 ])



-- kolakoski 20 == [1,2,2,1,1,2,1,2,2,1,2,2,1,1,2,1,1,2,2,1]
