// Disarium numbers: digits raised to their 1-based positions sum to n.
let isDisarium (n: int) =
    string n
    |> Seq.mapi (fun i c -> pown (int c - int '0') (i + 1))
    |> Seq.sum
    |> (=) n

[ 1 .. 999 ] |> List.filter isDisarium |> List.map string |> String.concat " " |> printfn "%s"
