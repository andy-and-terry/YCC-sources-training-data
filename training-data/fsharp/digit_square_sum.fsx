let digitSquareSum (n: int) =
    string (abs n) |> Seq.sumBy (fun c -> let d = int c - int '0' in d * d)

printfn "%d" (digitSquareSum 123)
printfn "%d" (digitSquareSum -99)
