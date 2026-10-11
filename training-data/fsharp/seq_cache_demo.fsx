let expensive =
    seq {
        for i in 1 .. 3 do
            printfn "computing %d" i
            yield i * i
    }

printfn "-- uncached, two passes"
expensive |> Seq.sum |> printfn "%d"
expensive |> Seq.sum |> printfn "%d"

let cached = Seq.cache expensive
printfn "-- cached, two passes"
cached |> Seq.sum |> printfn "%d"
cached |> Seq.sum |> printfn "%d"
