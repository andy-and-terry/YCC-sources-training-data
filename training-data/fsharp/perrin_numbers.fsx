// Perrin numbers: P(0) = 3, P(1) = 0, P(2) = 2, P(n) = P(n-2) + P(n-3)
let perrin =
    Seq.unfold (fun (a, b, c) -> Some(a, (b, c, a + b))) (3L, 0L, 2L)

perrin |> Seq.take 15 |> Seq.map string |> String.concat " " |> printfn "%s"
