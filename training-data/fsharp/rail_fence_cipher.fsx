let order n k =
    let cycle = 2 * (k - 1)
    let rail i = let r = i % cycle in if r < k then r else cycle - r
    [ 0 .. n - 1 ] |> List.sortBy (fun i -> rail i, i)

let encrypt (t: string) k = order t.Length k |> List.map (fun i -> t.[i]) |> System.String.Concat

let decrypt (c: string) k =
    order c.Length k
    |> List.mapi (fun pos i -> i, c.[pos])
    |> List.sortBy fst
    |> List.map snd
    |> System.String.Concat

let c = encrypt "WEAREDISCOVERED" 3
printfn "%s %s" c (decrypt c 3)
