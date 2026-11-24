module RepunitNumbers exposing (repunits)

-- Repunits: R_n = 11...1 (n ones), built as R_{n-1}*10 + 1.
-- repunits 3 == [1,11,111]


repunits : Int -> List Int
repunits count =
    List.range 1 count
        |> List.foldl
            (\_ ( r, acc ) ->
                let
                    next =
                        r * 10 + 1
                in
                ( next, next :: acc )
            )
            ( 0, [] )
        |> Tuple.second
        |> List.reverse
