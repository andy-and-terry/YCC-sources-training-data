let fetchValue (name: string) (delayMs: int) =
    async {
        do! Async.Sleep delayMs
        return sprintf "%s -> %d" name (delayMs * 2)
    }

let combined =
    async {
        let! a = fetchValue "first" 50
        let! b = fetchValue "second" 30
        return [ a; b ]
    }

printfn "%A" (Async.RunSynchronously combined)

let parallelResults =
    [ fetchValue "x" 20; fetchValue "y" 10; fetchValue "z" 40 ]
    |> Async.Parallel
    |> Async.RunSynchronously

printfn "%A" parallelResults
