module ListScanlRunningTotal exposing (runningTotals, runningMax)


runningTotals : List Int -> List Int
runningTotals numbers =
    List.foldl
        (\n acc ->
            case acc of
                [] ->
                    [ n ]

                last :: _ ->
                    (last + n) :: acc
        )
        []
        numbers
        |> List.reverse


runningMax : List Int -> List Int
runningMax numbers =
    case numbers of
        [] ->
            []

        first :: rest ->
            List.foldl
                (\n acc ->
                    case acc of
                        m :: _ ->
                            max m n :: acc

                        [] ->
                            [ n ]
                )
                [ first ]
                rest
                |> List.reverse
