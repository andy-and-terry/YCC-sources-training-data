// Infinite sequence of Pell numbers: P(n) = 2*P(n-1) + P(n-2)
let pell =
    Seq.unfold (fun (a, b) -> Some(a, (b, 2L * b + a))) (0L, 1L)

pell
|> Seq.take 15
|> Seq.iteri (fun i p -> printfn "P(%d) = %d" i p)
