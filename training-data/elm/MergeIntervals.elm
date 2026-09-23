module MergeIntervals exposing (Interval, merge)


type alias Interval =
    { start : Int
    , end : Int
    }


merge : List Interval -> List Interval
merge intervals =
    intervals
        |> List.sortBy .start
        |> List.foldl step []
        |> List.reverse


step : Interval -> List Interval -> List Interval
step interval merged =
    case merged of
        [] ->
            [ interval ]

        last :: rest ->
            if interval.start <= last.end then
                { last | end = max last.end interval.end } :: rest

            else
                interval :: last :: rest
