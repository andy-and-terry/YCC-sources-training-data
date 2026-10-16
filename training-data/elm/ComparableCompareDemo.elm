module ComparableCompareDemo exposing (describe, sortDescending)


describe : Int -> Int -> String
describe a b =
    case compare a b of
        LT ->
            "less"

        EQ ->
            "equal"

        GT ->
            "greater"


sortDescending : List comparable -> List comparable
sortDescending =
    List.sortWith (\a b -> compare b a)
