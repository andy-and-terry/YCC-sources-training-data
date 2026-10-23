let pairs = List.allPairs [1; 2; 3] ["a"; "b"]
printfn "%A" pairs

let grid = List.allPairs [0 .. 2] [0 .. 2] |> List.filter (fun (x, y) -> x <> y)
printfn "%d off-diagonal cells" (List.length grid)
