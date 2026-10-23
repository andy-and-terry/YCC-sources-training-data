module RunningTotalFoldDemo exposing (runningTotals, withPrevious)


runningTotals : List Int -> List Int
runningTotals nums =
    nums
        |> List.foldl
            (\n ( total, acc ) ->
                let
                    next =
                        total + n
                in
                ( next, next :: acc )
            )
            ( 0, [] )
        |> Tuple.second
        |> List.reverse


withPrevious : List a -> List ( Maybe a, a )
withPrevious items =
    List.map2 Tuple.pair (Nothing :: List.map Just items) items
