let mergeIntervals (intervals: (int * int) list) =
    intervals
    |> List.sortBy fst
    |> List.fold
        (fun acc (s, e) ->
            match acc with
            | (ps, pe) :: rest when s <= pe -> (ps, max pe e) :: rest
            | _ -> (s, e) :: acc)
        []
    |> List.rev

printfn "%A" (mergeIntervals [ (1, 3); (8, 10); (2, 6); (15, 18) ])
