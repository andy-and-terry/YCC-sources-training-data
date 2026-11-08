let railFence (s: string) rails =
    let period = 2 * (rails - 1)
    let rail i = let m = i % period in if m < rails then m else period - m
    s
    |> Seq.mapi (fun i c -> rail i, i, c)
    |> Seq.sortBy (fun (r, i, _) -> r, i)
    |> Seq.map (fun (_, _, c) -> c)
    |> Seq.toArray
    |> System.String

printfn "%s" (railFence "WEAREDISCOVERED" 3)
