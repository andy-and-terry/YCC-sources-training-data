open System.Threading.Tasks

let work n =
    task {
        do! Task.Delay 20
        return n * n
    }

let results =
    [ 1 .. 5 ]
    |> List.map work
    |> Task.WhenAll
    |> fun t -> t.Result

printfn "%A" results

let first = Task.WhenAny [| work 1; work 2 |] |> fun t -> t.Result.Result
printfn "first finished is square: %b" (first = 1 || first = 4)
