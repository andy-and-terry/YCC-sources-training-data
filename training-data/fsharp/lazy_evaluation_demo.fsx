let expensive =
    lazy (
        printfn "computing..."
        6 * 7
    )

printfn "before force"
printfn "value = %d" expensive.Value
printfn "again = %d" expensive.Value
printfn "created: %b" expensive.IsValueCreated

let naturals = Seq.initInfinite id
let evenSquares =
    naturals
    |> Seq.filter (fun n -> n % 2 = 0)
    |> Seq.map (fun n -> n * n)

evenSquares |> Seq.take 5 |> Seq.toList |> printfn "%A"

let noisy =
    seq {
        for i in 1 .. 3 do
            printfn "yielding %d" i
            yield i
    }

noisy |> Seq.head |> printfn "head = %d"
let cached = Seq.cache noisy
cached |> Seq.length |> printfn "length = %d"
