module CombinationSum exposing (find)


find : List Int -> Int -> List (List Int)
find candidates target =
    backtrack candidates target []


backtrack : List Int -> Int -> List Int -> List (List Int)
backtrack candidates target current =
    if target == 0 then
        [ List.reverse current ]

    else if target < 0 then
        []

    else
        case candidates of
            [] ->
                []

            first :: rest ->
                backtrack candidates (target - first) (first :: current)
                    ++ backtrack rest target current
