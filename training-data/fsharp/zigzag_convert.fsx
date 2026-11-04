let zigzag (s: string) rows =
    if rows = 1 || rows >= s.Length then s
    else
        let cycle = [ 0 .. rows - 1 ] @ [ rows - 2 .. -1 .. 1 ]
        s
        |> Seq.zip (Seq.initInfinite (fun i -> cycle.[i % cycle.Length]))
        |> Seq.sortBy fst   // Seq.sortBy is stable
        |> Seq.map snd
        |> Seq.toArray
        |> System.String

printfn "%s" (zigzag "PAYPALISHIRING" 3)
