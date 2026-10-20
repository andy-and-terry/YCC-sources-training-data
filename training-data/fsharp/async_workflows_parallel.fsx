let work n = async {
    do! Async.Sleep 10
    return n * n
}

let results = [ 1 .. 5 ] |> List.map work |> Async.Parallel |> Async.RunSynchronously
printfn "%A" results

let timeout = async {
    let! r = Async.Catch(async { failwith "boom" })
    match r with
    | Choice1Of2 v -> printfn "ok %A" v
    | Choice2Of2 e -> printfn "caught %s" e.Message
}
Async.RunSynchronously timeout

let t = System.Threading.Tasks.Task.Run(fun () -> 21 * 2)
printfn "%d" t.Result
