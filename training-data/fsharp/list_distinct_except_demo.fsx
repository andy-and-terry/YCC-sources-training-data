let xs = [ 3; 1; 3; 2; 1; 5 ]

printfn "%A" (List.distinct xs)
printfn "%A" (List.distinctBy (fun x -> x % 2) xs)
printfn "%A" (List.except [ 1; 2 ] xs)
printfn "%A" (List.countBy id xs |> List.filter (fun (_, c) -> c > 1) |> List.map fst)
printfn "%A" (List.contains 5 xs)
printfn "%A" (List.exists (fun x -> x > 4) xs)
printfn "%A" (List.forall (fun x -> x > 0) xs)
printfn "%A" (Set.ofList xs |> Set.toList)
