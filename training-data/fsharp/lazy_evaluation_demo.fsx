let expensive =
    lazy (
        printfn "computing..."
        42
    )

printfn "created"
printfn "first: %d" (expensive.Force())
printfn "second: %d" expensive.Value
printfn "evaluated: %b" expensive.IsValueCreated

let lazyList =
    seq {
        for i in 1 .. 5 do
            printfn "yielding %d" i
            yield i * i
    }

printfn "taking two"
lazyList |> Seq.take 2 |> Seq.iter (printfn "got %d")

let cached = lazyList |> Seq.cache
printfn "%d" (Seq.sum cached)
printfn "%d" (Seq.length cached)

let fallback = lazy (failwith "never forced")
let choose useIt = if useIt then 1 else 0
printfn "%d" (choose false)
