let numbers = [ 1 .. 10 ]

numbers |> List.chunkBySize 4 |> printfn "%A"
numbers |> List.windowed 3 |> List.map List.sum |> printfn "%A"
numbers |> List.pairwise |> List.map (fun (a, b) -> b - a) |> printfn "%A"
numbers |> List.splitAt 3 |> printfn "%A"
numbers |> List.skip 7 |> printfn "%A"
numbers |> List.truncate 3 |> printfn "%A"
numbers |> List.partition (fun n -> n % 3 = 0) |> printfn "%A"
numbers |> List.splitInto 3 |> printfn "%A"
