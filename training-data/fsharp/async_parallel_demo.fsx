let work n = async { return n * n }
let results = [1 .. 4] |> List.map work |> Async.Parallel |> Async.RunSynchronously
printfn "%A" results
