let isArmstrong (n: int) =
    let digits = string n |> Seq.map (fun c -> int c - int '0') |> List.ofSeq
    let len = List.length digits
    digits |> List.sumBy (fun d -> pown d len) = n

[ 1 .. 999 ] |> List.filter isArmstrong |> printfn "%A" // 1..9, 153, 370, 371, 407
