let powersOfTwo =
    Seq.unfold (fun state -> Some(state, state * 2L)) 1L

let triangularNumbers =
    Seq.unfold (fun (n, sum) -> Some(sum, (n + 1, sum + n + 1))) (0, 0)

printfn "%A" (powersOfTwo |> Seq.take 8 |> Seq.toList)
printfn "%A" (triangularNumbers |> Seq.take 6 |> Seq.toList)
