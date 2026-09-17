module SubsetSum exposing (hasSubsetSum)


hasSubsetSum : List Int -> Int -> Bool
hasSubsetSum items target =
    case items of
        [] ->
            target == 0

        x :: rest ->
            if target < 0 then
                False

            else
                hasSubsetSum rest (target - x) || hasSubsetSum rest target
