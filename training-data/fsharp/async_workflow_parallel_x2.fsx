let work n = async {
    do! Async.Sleep 10
    return n * n
}

[1 .. 4]
|> List.map work
|> Async.Parallel
|> Async.RunSynchronously
|> Array.sum
|> printfn "%d"
