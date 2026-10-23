// Sylvester's sequence: s(0) = 2, s(n+1) = s(n)^2 - s(n) + 1
let sylvester =
    Seq.unfold (fun (s: bigint) -> Some(s, s * s - s + 1I)) 2I

sylvester
|> Seq.take 8
|> Seq.iteri (fun i s -> printfn "s(%d) = %A" i s)
