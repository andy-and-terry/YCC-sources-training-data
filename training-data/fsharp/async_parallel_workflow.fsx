let work n = async { do! Async.Sleep 1; return n * n }
[ 1 .. 4 ] |> List.map work |> Async.Parallel |> Async.RunSynchronously |> printfn "%A"
