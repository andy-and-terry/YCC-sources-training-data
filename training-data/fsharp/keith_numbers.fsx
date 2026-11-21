// Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits.
let isKeith (n: int) =
    let seed = string n |> Seq.map (fun c -> int c - int '0') |> List.ofSeq
    let k = seed.Length
    // seq is kept newest-first
    let rec go (seq: int list) =
        let last = List.head seq
        if last >= n then last = n
        else go ((seq |> List.take k |> List.sum) :: seq)
    go (List.rev seed)

[ 10 .. 1199 ] |> List.filter isKeith |> List.map string |> String.concat " " |> printfn "%s"
