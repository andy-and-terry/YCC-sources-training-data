let squares =
    seq {
        for i in 1 .. 10 do
            if i % 2 = 0 then yield i * i
    }

squares |> Seq.toList |> printfn "%A"
