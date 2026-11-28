let insertInterval (ivs: (int * int) list) (nlo, nhi) =
    let before, rest = ivs |> List.partition (fun (_, h) -> h < nlo)
    let after, overlap = rest |> List.partition (fun (l, _) -> l > nhi)
    let lo = overlap |> List.fold (fun m (l, _) -> min m l) nlo
    let hi = overlap |> List.fold (fun m (_, h) -> max m h) nhi
    before @ [ (lo, hi) ] @ after

printfn "%A" (insertInterval [ (1, 3); (6, 9) ] (2, 5)) // [(1, 5); (6, 9)]
