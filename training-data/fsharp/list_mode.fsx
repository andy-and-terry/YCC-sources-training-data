let modes items =
    let counts = items |> List.countBy id
    let top = counts |> List.map snd |> List.max
    counts |> List.filter (fun (_, c) -> c = top) |> List.map fst |> List.sort

printfn "%A" (modes [ 1; 2; 2; 3; 3; 4 ])
