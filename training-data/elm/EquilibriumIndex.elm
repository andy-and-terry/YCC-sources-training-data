module EquilibriumIndex exposing (equilibriumIndex)


equilibriumIndex : List Int -> Maybe Int
equilibriumIndex nums =
    let
        total =
            List.sum nums

        go i left rest =
            case rest of
                [] ->
                    Nothing

                v :: tail ->
                    if left == total - left - v then
                        Just i

                    else
                        go (i + 1) (left + v) tail
    in
    go 0 0 nums



-- equilibriumIndex [ 1, 7, 3, 6, 5, 6 ] == Just 3
