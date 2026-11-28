let jaccard (a: Set<'a>) (b: Set<'a>) =
    let u = Set.union a b |> Set.count
    if u = 0 then 1.0 else float (Set.intersect a b |> Set.count) / float u

printfn "%f" (jaccard (set [1; 2; 3; 4]) (set [3; 4; 5]))
