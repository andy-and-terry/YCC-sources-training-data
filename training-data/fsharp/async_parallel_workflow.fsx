let work n = async { do! Async.Sleep 10; return n * n }

[ 1 .. 5 ]
|> List.map work
|> Async.Parallel
|> Async.RunSynchronously
|> printfn "%A"
