let expensive =
    lazy (
        printfn "computing..."
        42
    )

printfn "before"
printfn "value: %d" expensive.Value
printfn "again: %d" expensive.Value
printfn "created: %b" expensive.IsValueCreated

let naturals = Seq.initInfinite id
let evenSquares = naturals |> Seq.filter (fun n -> n % 2 = 0) |> Seq.map (fun n -> n * n)
printfn "%A" (Seq.truncate 5 evenSquares |> Seq.toList)
